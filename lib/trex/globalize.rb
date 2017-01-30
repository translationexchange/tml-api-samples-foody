class Trex::Globalize
  def initialize
    @client = Trex::ApiClient.new("464429b1b370daf735ae0f88cc03361bc94a27fff450ee01196af244c83c1948")
  end

  def client
    @client
  end

  # Tables: recipes_translations, ingridients_translations, etc
  # Walk through all translatable models
  # Walk through each model
  # Upload translations for each model
  def upload_translations(classes = ["Recipe"])
    classes.each do |class_name|
      const = class_name.constantize
      const.find_each do |model|
        upload_model(model)
      end
    end
  end

  def fetch_translations
    get_translation_keys do |page|
      page.each do |tkey|
        model, attribute = parse_key(tkey['external_id'])
        tkey['translations'].each do |tr|
          if tr['locked']
            I18n.locale = tr['locale']
            model.update_attribute(attribute, tr['label'])
            puts "Updated translation #{model.class.name} #{model.id} #{attribute} #{tr['label']}"
          end
        end
      end
    end
  end

private

  def upload_model(model)
    singular_name = model.class.table_name.singularize
    table_name = "#{singular_name}_translations"
    translations= ActiveRecord::Base.connection.execute(%Q{
      select * from #{singular_name}_translations WHERE #{singular_name}_id = #{model.id};
    }).to_a

    model.translated_attribute_names.each do |attribute|
      tr_data = translations.map {|t| {locale: t['locale'], label: t[attribute.to_s]} }

      key = make_key(model, attribute)
      params = {
        translation_key: {
          label: model.send(attribute),
          external_id: key,
          translations: tr_data
        }
      }

      puts "SEND PARAMS #{params.inspect}"

      begin
        client.post("translation_keys", params)
      rescue RestClient::UnprocessableEntity => e
        if e.response.index("External has already been taken")
          # We have already uploaded this translation key
          client.put("translation_keys/#{key}", params)
        else
          raise e
        end
      end
    end
  end

  def get_translation_keys(&block)
    cur_page = 0
    max_pages = 1_000_000_000
    while cur_page <= max_pages
      resp = client.get("translation_keys", {per_page: 5})
      max_pages = resp['pagination']['total_pages']
      block.call(resp['results'])
      cur_page += 1
    end
  end

  def make_key(model, attribute)
    [model.class.table_name, model.id, attribute].join(":")
  end

  def parse_key(external_id)
    ext_id = external_id.split(":")
    const = ext_id[0].classify.constantize
    [const.find(ext_id[1]), ext_id[2]]
  end
end


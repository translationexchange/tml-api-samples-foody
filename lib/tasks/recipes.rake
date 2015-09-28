namespace :recipes do

  desc 'Initializes the default recipes database'
  task :init => :environment do
    defaults = File.read(File.join(Rails.root, 'config', 'data', 'recipes.json'))
    defaults = JSON.parse(defaults)

    Category.delete_all
    Recipe.delete_all

    defaults['categories'].each_with_index do |c, index|
      Category.create(
        key: c['id'],
        name: c['name'],
        featured_index: index,
        locale: 'en'
      )
    end

    category_index = {}
    defaults['recipes'].each do |r|
      category_index[r['category']] ||= 0
      recipe = Recipe.create(
        key:            r['id'],
        category:       Category.where(key: r['category']).first,
        name:           r['name'],
        locale:         'en',
        description:    r['description'],
        image:          r['image'],
        preparation:    r['preparation'],
        featured_index:   category_index[r['category']]
      )
      category_index[r['category']] += 1

      (r['directions'] || []).each_with_index do |d, index|
        Direction.create(
          recipe:       recipe,
          description:  d,
          index:        index
        )
      end

      (r['ingredients'] || []).each_with_index do |i, index|
        Ingredient.create(
          recipe:       recipe,
          quantity:     i['quantity'],
          name:         i['name'],
          measurements: i['measurements'],
          index:        index
        )
      end
    end

  end

end

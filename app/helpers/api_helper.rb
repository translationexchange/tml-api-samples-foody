module ApiHelper

  def paginate(collection)
    current_page_num = collection.current_page
    last_page_num = collection.total_pages

    links = {
        :first => first_page,
        :previous => previous_page(current_page_num),
        :self => current_page(current_page_num),
        :next => next_page(current_page_num, last_page_num),
        :last => last_page(last_page_num)
    }

    links.keep_if {|key, value| value.present?}

    {
        :total_count => collection.total_count,
        :current_page => current_page_num,
        :total_pages => last_page_num,
        :per_page => per_page,
        :links => links
    }
  end

  def image_url_for(path)
    return path if path.match(/^http/)
    # "#{request_host}/assets/#{path}"
    "#{request_host}/images/#{path}"
  end

  def request_host
    if [80, 443].include?(request.port)
      "#{request.scheme}://#{request.host}"
    else
      "#{request.scheme}://#{request.host}:#{request.port}"
    end
  end

  def api_url_for(url_params)
    result = url_for(url_params.merge(
        :access_token => params[:access_token]
    ))
    "#{request_host}/api/#{version}#{result}"
  end

  def first_page
    api_url_for(params.merge(:page => 1))
  end

  def previous_page(current_page_num)
    return nil if current_page_num <= 1
    api_url_for(params.merge(:page => current_page_num-1))
  end

  def current_page(current_page_num)
    api_url_for(params.merge(:page => current_page_num))
  end

  def next_page(current_page_num, last_page_num)
    return nil if current_page_num >= last_page_num
    api_url_for(params.merge(:page => current_page_num+1))
  end

  def last_page(last_page_num)
    api_url_for(params.merge(:page => last_page_num))
  end

  #def format_time(time)
  #  time.strftime('%m-%d-%Y %H:%M:%S %Z')
  #end
  #
  def format_date(date)
    date.strftime('%Y-%m-%d')
  end

  def format_timestamp(date)
    return unless date
    date.strftime('%Y-%m-%d %H:%M:%S')
  end

  def api_options(key)
    return unless @api_options
    @api_options[key]
  end

end
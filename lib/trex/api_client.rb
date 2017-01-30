class Trex::ApiClient
  HOST = "http://localhost:3000/v2/"

  def initialize(token)
    @access_token = token
  end

  def get(p, params = {})
    req(:get, p, params, {})
  end

  def post(p, params = {})
    req(:post, p, params, {})
  end

  def put(p, params = {})
    req(:put, p, params, {})
  end

  def delete(p, params = {})
    req(:delete, p, params, {})
  end

  def req(mthd, path, params, headers)
    url = "#{HOST}#{path}"
    params[:access_token] = @access_token
    res = if mthd == :get
      RestClient.get(url, {params: params})
    else
      RestClient.send(mthd, url, params.to_json, {'Content-Type' => "application/json"})
    end

    JSON.parse(res)
  end
end

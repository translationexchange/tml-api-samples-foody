Rabl.configure do |config|
  config.include_json_root = false
  config.view_paths = [Rails.root.join('app', 'views')]
  config.exclude_nil_values = true
end

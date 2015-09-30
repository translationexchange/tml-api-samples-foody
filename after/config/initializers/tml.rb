Tml.configure do |config|
  config.application = {
      key:    'b8206d1b982a5410f34da48490d7653fe25266f16c70482ccc953fb7264547d1',
      token:  '573d1cb5d207b439abdcf1cad8ff76c56b00c275fa032a69f748b34c82613e07'
  }

  config.cache = {
    enabled:    true,
    adapter:    'memcache',
    namespace:  'b8206d1b982a5410f34da48490d7653fe25266f16c70482ccc953fb7264547d1',
    host:       'localhost:11211'
  }

  # config.cache = {
  #     enabled:    true,
  #     adapter:    'file',
  #     path:       'config/tml',
  #     version:    'current'
  # }

  config.logger  = {
    enabled:  true,
    path:     "#{Rails.root}/log/tml.log",
    level:    'debug'
  }
end

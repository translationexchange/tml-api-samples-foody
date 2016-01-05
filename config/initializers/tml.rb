Tml.configure do |config|

  tml_env = Rails.env
  # tml_env = 'production'

  if tml_env == 'production'
    config.application = {
      key:    'b8206d1b982a5410f34da48490d7653fe25266f16c70482ccc953fb7264547d1',
      token:  '573d1cb5d207b439abdcf1cad8ff76c56b00c275fa032a69f748b34c82613e07'
    }

    config.cache = {
      enabled:    false,
      adapter:    'memcache',
      host:       'tememcached.yptuob.cfg.usw1.cache.amazonaws.com:11211',
      namespace:  'b8206d1b982a5410f34da48490d7653fe25266f16c70482ccc953fb7264547d1',
    }

  else
    config.application = {
        host:   'http://localhost:3000',
        key:    'b8206d1b982a5410f34da48490d7653fe25266f16c70482ccc953fb7264547d1',
        token:  '573d1cb5d207b439abdcf1cad8ff76c56b00c275fa032a69f748b34c82613e07'
    }

    config.cache = {
      enabled:    false,
      adapter:    'file',
      path:       'config/tml',
      version:    'current'
    }

    config.agent = {
        enabled:  true,
        type:     'agent',
        host:     'http://localhost:8282/dist/agent.js',
        cache:    5.minutes
    }

    config.logger  = {
        enabled:  true,
        path:     "#{Rails.root}/log/tml.log",
        level:    'debug'
    }
  end

end

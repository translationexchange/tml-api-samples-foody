Tml.configure do |config|

  tml_env = Rails.env
  tml_env = 'production'

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

    config.agent = {
        host:     'https://tools.translationexchange.com/agent/stable/agent.min.js',
        cache:    1.second
    }

  else
    config.application = {
        host:   'http://localhost:3000',
        key:    'c3f8c6cf0c11cd8b5953a5e69781b509a91b0005c9c459908b42b22b8ad37c8a',
        token:  'af5954f71a2d0c6b6e01d28246d22902c06a9312c9935c425f4ae3df5af000fd'
    }

    config.cache = {
      enabled:    false,
      adapter:    'file',
      path:       'config/tml',
      version:    'current'
    }

    config.agent = {
        host:     'http://localhost:8282/dist/agent.js',
        cache:    5.minutes
    }
  end

  config.logger  = {
      enabled:  Rails.env.development?,
      path:     "#{Rails.root}/log/tml.log",
      level:    'debug'
  }

end

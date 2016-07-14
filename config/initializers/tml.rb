Tml.configure do |config|

  # I18n.backend = I18n::Backend::Tml.new

  tml_env = Rails.env
  # tml_env = 'staging'

  if tml_env == 'staging'
    config.application = {
        # key:      '96b5cb2962dab21e7338902a5802e299463d319aa24d53ec19d5e156fff0fcbc',
        host:     'https://staging-api.translationexchange.com',
        key:      '455edc193506a1668819854f32da69e023638fa5da139ac30e507ba9c7af6fe0'
    }

    config.agent = {
        host:     'https://tools.translationexchange.com/agent/staging/agent.min.js',
        cache:    1.second
    }

    config.cache = {
        adapter:                'memcache',
        host:                   'localhost:11211',
        version_check_interval: 1.minute
    }

  elsif tml_env == 'sandbox'
    config.application = {
        key:      'c840fd9807c1bed782c0f758f4722408d937888b10337c69f86db492225e2e6a',
        host:     'https://sandbox-api.translationexchange.com',
    }

    config.agent = {
        host:     'https://tools.translationexchange.com/agent/sandbox/agent.min.js',
        cache:    1.second
    }

  elsif tml_env == 'production'
    config.application = {
      key:    'b8206d1b982a5410f34da48490d7653fe25266f16c70482ccc953fb7264547d1',
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
        # key:      '9fbe39b689f222be9de4222d549403bdd1e7308827cd8404d6ccbfae041d1312',
        key:      '703e5af6d9cf21f95416cce2839f52012dced89a93fc0790ce31107b44ba1592',
        host:     'http://localhost:3000',
        cdn_host: 'https://trex-snapshots-dev.s3-us-west-1.amazonaws.com',
    }

    # config.postoffice = {
    #     key:      'sadfs9adf0asdf90as9df0as9df0as9df09asdf09asdfa0sdfu09909090909009'
    # }

    # config.cache = {
    #   adapter:    'file',
    #   path:       'config/tml',
    #   version:    'current'
    # }

    config.cache = {
        adapter:                'memcache',
        host:                   'localhost:11211',
        version_check_interval: 1.minute
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

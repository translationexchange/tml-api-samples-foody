Tml.configure do |config|

  if Rails.env.production?
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
        key:    '096e039beebf4237f6829040276c7851996b2c8601abc6c4225d215d32b4c12c',
        token:  '86cb4f636d23def23c348c119d4e8515bf188967d902ffeca5eed56e3a6c2f63'
    }

    config.cache = {
      enabled:    false,
      adapter:    'file',
      path:       'config/tml',
      version:    'current'
    }
  end

  config.logger  = {
    enabled:  false,
    path:     "#{Rails.root}/log/tml.log",
    level:    'debug'
  }
end

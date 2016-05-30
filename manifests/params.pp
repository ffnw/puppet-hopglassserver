class hopglassserver::params {

  $announced_port = 45123

  $interval_statistics = 60
  $interval_nodeinfo   = 300

  $storage_file = './storage.json'

  $purge_maxAge   = 14
  $purge_interval = 86400

  $provider_offlineTime        = 900
  $provider_metricsOfflineTime = 60
  $provider_ffapiPath          = './ffapi/'

  $webserver_ip   = '::'
  $webserver_port = 4000

}


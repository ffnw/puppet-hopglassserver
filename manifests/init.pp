class hopglassserver (
  Integer               $announced_port              = $hopglassserver::params::announced_port,
  Integer               $interval_statistics         = $hopglassserver::params::interval_statistics,
  Integer               $interval_nodeinfo           = $hopglassserver::params::interval_nodeinfo,
  String                $storage_file                = $hopglassserver::params::storage_file,
  Integer               $purge_maxAge                = $hopglassserver::params::purge_maxAge,
  Integer               $purge_interval              = $hopglassserver::params::purge_interval,
  Integer               $provider_offlineTime        = $hopglassserver::params::provider_offlineTime,
  Integer               $provider_metricsOfflineTime = $hopglassserver::params::provider_metricsOfflineTime,
  String                $provider_ffapiPath          = $hopglassserver::params::provider_ffapiPath,
  String                $webserver_ip                = $hopglassserver::params::webserver_ip,
  Integer               $webserver_port              = $hopglassserver::params::webserver_port,
) inherits hopglassserver::params {

  class { 'hopglassserver::install': } ->
  class { 'hopglassserver::config': } ~>
  class { 'hopglassserver::service': }

  contain hopglassserver::install
  contain hopglassserver::config
  contain hopglassserver::service

  create_resources('hopglassserver::receiver', hiera('hopglassserver::receiver', {}))

}


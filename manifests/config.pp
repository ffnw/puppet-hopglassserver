class hopglassserver::config inherits hopglassserver {

  file { '/etc/hopglass-server/':
    ensure => directory,
    owner  => 'hopglass',
    group  => 'hopglass',
    mode   => '0750',
  } ->
  file { '/etc/hopglass-server/puppet/':
    ensure => directory,
    owner  => 'hopglass',
    group  => 'hopglass',
    mode   => '0750',
  } ->
  concat { '/etc/hopglass-server/puppet/config.json':
    ensure         => present,
    ensure_newline => true,
    owner          => 'hopglass',
    group          => 'hopglass',
  }

  concat::fragment { 'hopglassserver-configtop':
    target  => '/etc/hopglass-server/puppet/config.json',
    order   => 0,
    content => epp('hopglassserver/configtop.epp', {
      announced_port             => $announced_port,
      interval_statistics        => $interval_statistics,
      interval_nodeinfo          => $interval_nodeinfo,
    })
  }

  concat::fragment { 'hopglassserver-configbottom':
    target  => '/etc/hopglass-server/puppet/config.json',
    order   => 2,
    content => epp('hopglassserver/configbottom.epp', {
      storage_interval            => $storage_interval,
      storage_file                => $storage_file,
      purge_maxAge                => $purge_maxAge,
      purge_interval              => $purge_interval,
      provider_offlineTime        => $provider_offlineTime,
      provider_metricsOfflineTime => $provider_metricsOfflineTime,
      provider_ffapiPath          => $provider_ffapiPath,
      webserver_ip                => $webserver_ip,
      webserver_port              => $webserver_port,
    })
  }

}


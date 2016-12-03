class hopglassserver::install inherits hopglassserver {

  apt::source { 'nodesource':
    location => 'https://deb.nodesource.com/node_6.x',
    repos    => 'main',
    include  => {
      'deb' => true,
      'src' => true,
    },
    key      => {
      'id'     => '9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280',
      'server' => 'pgp.mit.edu',
    },
  }

  ["nodejs","git"].each | $value | {
    if(!defined(Package[$value])) {
      package { $value:
        ensure => installed,
      }
    }
  }

  group { 'hopglass':
    ensure => present,
    system => true
  } ->
  user { 'hopglass':
    ensure => present,
    system => true,
    shell  => '/bin/false',
    home   => '/opt/hopglass',
    gid    => 'hopglass'
  } ->
  file { '/opt/hopglass':
    ensure => directory,
    owner  => 'hopglass',
    group  => 'hopglass',
    mode   => '0755'
  } ->
  vcsrepo { '/opt/hopglass/server':
    ensure   => latest,
    owner    => 'hopglass',
    group    => 'hopglass',
    provider => 'git',
    require  => [ Package['git'] ],
    source   => 'https://github.com/hopglass/hopglass-server.git',
    revision => 'master',
  } ~>
  exec { 'hopglassserver npm install':
    cwd         => '/opt/hopglass/server',
    command     => 'npm install',
    path        => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/' ],
    refreshonly => true,
  } ->
  file { '/lib/systemd/system/hopglass-server@.service':
    ensure => present,
    source => '/opt/hopglass/server/hopglass-server@.service'
  }

}


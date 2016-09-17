class hopglassserver::install inherits hopglassserver {

  ["nodejs","git"].each | $value | {
    if(!defined(Package[$value])) {
      package { $value:
        ensure => installed,
      }
    }
  }

  user { 'hopglass':
    ensure => present,
    system => true,
    shell  => '/bin/false',
    home   => '/opt/hopglass',
    gid    => 'hopglass'
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
  }

}


class hopglassserver::install inherits hopglassserver {

  if !defined(Package['git']) {
    package { 'git':
      ensure => installed,
    }
  }

  exec { 'bootstrap hopglass-server':
    cwd     => '/tmp',
    command => 'wget https://raw.githubusercontent.com/hopglass/hopglass-server/v0.1.1/scripts/bootstrap.sh && sed "s;^install$;;g" -i bootstrap.sh && sed "s;^ask_user$;;g" -i bootstrap.sh && sed "s;pidof systemd;pgrep -x systemd;g" -i /tmp/bootstrap.sh && bash bootstrap.sh; rm bootstrap.sh',
    unless  => '/usr/bin/test -d /opt/hopglass/server',
    path    => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/' ],
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


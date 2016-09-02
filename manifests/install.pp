class hopglassserver::install inherits hopglassserver {

  if !defined(Package['git']) {
    package { 'git':
      ensure => installed,
    }
  }

  vcsrepo { '/opt/hopglass-server':
    ensure   => latest,
    owner    => 'root',
    group    => 'root',
    provider => 'git',
    require  => [ Package['git'] ],
    source   => 'https://github.com/hopglass/hopglass-server.git',
    revision => 'master',
  } ~>
  exec { 'bootstrap hopglass-server':
    cwd     => '/opt/hopglass-server',
    command => 'bash bootstrap.sh',
    path    => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/' ],
  }

}


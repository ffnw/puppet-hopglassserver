class hopglassserver::install inherits hopglassserver {

  exec { 'bootstrap hopglass-server':
    cwd     => '/tmp',
    command => '/usr/bin/wget https://raw.githubusercontent.com/hopglass/hopglass-server/v0.1.1/scripts/bootstrap.sh && /bin/bash bootstrap.sh && /bin/rm bootstrap.sh',
    unless  => '/usr/bin/test -f /opt/hopglass/server',
  }

}


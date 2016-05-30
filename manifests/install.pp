class hopglassserver::install inherits hopglassserver {

  exec { 'bootstrap hopglass-server':
    cwd     => '/tmp',
    command => 'wget https://raw.githubusercontent.com/hopglass/hopglass-server/v0.1.1/scripts/bootstrap.sh && sed "s;pidof systemd;pgrep -x systemd;g" -i /tmp/bootstrap.sh && bash bootstrap.sh; rm bootstrap.sh',
    unless  => '/usr/bin/test -d /opt/hopglass/server',
    path    => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/' ],
  }

}


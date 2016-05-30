define hopglassserver::interface {

  include hopglassserver
  include hopglassserver::params

  concat::fragment { "hopglassserver-configinterface-${title}":
    target  => '/etc/hopglass-server/puppet/config.json',
    order   => 1,
    content => "\"${title}\"",
  }

}


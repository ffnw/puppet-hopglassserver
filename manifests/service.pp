class hopglassserver::service inherits hopglassserver {

  service { 'hopglass-server@puppet':
    enable   => true,
    ensure   => running,
  }

}


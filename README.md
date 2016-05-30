# puppet-hopglassserver

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with hopglassserver](#setup)
    * [Beginning with hopglassserver](#beginning-with-hopglassserver)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Installs and configures hopglass-server.

## Setup

### Beginning with hopglassserver

```puppet
class { 'hopglassserver': }

hopglassserver::interface { 'bat0': }
```

## Usage

```puppet
class { 'hopglassserver':
  announced_port              => 45123,
  interval_statistics         => 60,
  interval_nodeinfo           => 300,
  storage_file                => './storage.json',
  purge_maxAge                => 14,
  purge_interval              => 86400,
  provider_offlineTime        => 900,
  provider_metricsOfflineTime => 60,
  provider_ffapiPath          => './ffapi/,
  webserver_ip                => '::',
  webserver_port              => 4000,
}

hopglassserver::interface { 'bat0': }
```

## Reference

* class hopglassserver
  * announced_port (optional, default 45123)
  * interval_statistics (optional, default 60)
  * interval_nodeinfo (optional, default 300)
  * storage_file (optional, default './storage.json')
  * purge_maxAge (optional, default 14)
  * purge_interval (optional, default 86400)
  * provider_offlineTime (optional, default 900)
  * provider_metricsOfflineTime (optional, default 60)
  * provider_ffapiPath (optional, default './ffapi/')
  * webserver_ip (optional, default '::')
  * webserver_port (optional, default 4000)

* define hopglassserver::interface

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.


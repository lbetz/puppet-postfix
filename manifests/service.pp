class postfix::service {

  $ensure  = $postfix::ensure
  $enable  = $postfix::enable
  $service = $params::service

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

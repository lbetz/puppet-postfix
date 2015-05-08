class postfix::install {

  $package = $params::package

  package { $package:
    ensure => installed,
  }

}

class postfix::params {

  case $::osfamily {

    'redhat': {
      $package = 'postfix'
      $service = 'postfix'
      $main_cf = '/etc/postfix/main.cf'
    }

    default: {
      fail("You're using ${::operatingsystem}, this platform not supported, yet.")
    }
  }

}

class postfix::config {

  $options = $postfix::options
  $main_cf = $params::main_cf

  file { $main_cf:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  create_resources('postfix::option', $options, {})

}

define postfix::option(
  $ensure = present,
  $option = $title,
  $value,
) {

  validate_re($ensure, '^(present|absent)$', 'Valid values for ensure are present and absent.')

  include postfix

  $main_cf = $params::main_cf

  file_line { "postfix::main::config::${option}":
    ensure => $ensure,
    path   => $main_cf,
    line   => "${option} = ${value}",
    match  => "^\s*${option}\s*=",
    notify => Class['postfix::service'],
  }

}

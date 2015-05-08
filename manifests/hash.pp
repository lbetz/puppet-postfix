define postfix::hash(
  $ensure = present,
  $source = $title,
) {

  validate_re($ensure, '^(present|absent)$', 'Valid values for ensure are present and absent.')

  include params

  file { $source:
    ensure => $ensure,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    require => Class['install'],
  }

  exec {"generate ${source}.db":
    command     => "/usr/sbin/postmap ${source}",
    #creates    => "${source}.db", # this prevents postmap from being run !
    subscribe   => File[$source],
    refreshonly => true,
  }

}

define postfix::hash::entry(
  $ensure = present,
  $entry  = $title,
  $value,
  $target,
) {

  validate_re($ensure, '^(present|absent)$', 'Valid values for ensure are present and absent.')

  file_line { "${target}::${entry}":
    ensure  => $ensure,
    path    => $target,
    line    => "${entry}\t${value}",
    match   => "^${entry}\s*",
    notify  => Exec["generate ${target}.db"],
  }

}

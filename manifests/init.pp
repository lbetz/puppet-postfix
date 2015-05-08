class postfix(
  $ensure  = running,
  $enable  = true,
  $options = {},
) inherits postfix::params {

  validate_re($ensure, '^(running|stopped)$', 'Valid values for ensure are running and stopped')
  validate_bool($enable)
  validate_hash($options)

  anchor { 'postfix::begin': }
    -> Class['install']
    -> Class['config']
    ~> Class['service']
    -> anchor { 'postfix::end': }

  include install, config, service

}

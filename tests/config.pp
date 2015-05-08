# ---
#postfix::options:
#  luser_relay:
#    ensure: absent
#    value: test
#  html_directory:
#    value: no
#
class { 'postfix':
  options => {
    'luser_relay' => {
      ensure => absent,
      value  => 'test',
    },
    'html_directory' => {
      value => 'no',
    },
  }
}

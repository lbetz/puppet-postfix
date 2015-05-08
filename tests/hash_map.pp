include postfix

postfix::hash { '/etc/postfix/virtual': }
postfix::hash::entry { 'user1@virtual-alias.domain':
  value  => 'address1',
  target => '/etc/postfix/virtual',
}
postfix::hash::entry { 'user2@virtual-alias.domain':
  ensure => absent,
  value  => 'address2, address3',
  target => '/etc/postfix/virtual',
}

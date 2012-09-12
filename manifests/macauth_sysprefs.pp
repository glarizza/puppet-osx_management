class osx_management::macauth_sysprefs {
  macauthorization { 'system.preferences':
  ensure    => present,
  comment   => "Changed by Puppet",
  group     => 'staff',
  auth_type => 'right',
  }
}

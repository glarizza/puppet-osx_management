class osx_management::macauth_datetime {
  require osx_management::macauth_sysprefs

  macauthorization { 'system.preferences.datetime':
    ensure     => 'present',
    allow_root => 'true',
    auth_class => 'user',
    auth_type  => 'right',
    comment    => 'Changed by Puppet',
    group      => 'staff',
    shared     => 'true',
  }
}

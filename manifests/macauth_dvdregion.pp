class osx_management::macauth_dvdregion {
  require osx_management::macauth_sysprefs

  macauthorization { 'system.device.dvd.setregion.initial':
    ensure     => present,
    auth_class => 'user',
    auth_type  => 'right',
    group      => 'everyone',
    shared     => 'true',
  }
}

class osx_management::macauth_printeraccess {
  require osx_management::macauth_sysprefs

  macauthorization { 'system.preferences.printing':
      ensure     => present,
      allow_root => true,
      auth_class => 'user',
      auth_type  => right,
      group      => 'staff',
  }
  # this is where we declare the list of users who should be in _lpadmin
  # future code revisions will allow us to add users to _lpadmin at user configuration
  group { '_lpadmin':
    ensure  => present,
    gid     => 98,
    members => ['puppet', 'luser', 'padmin'],
  }
}

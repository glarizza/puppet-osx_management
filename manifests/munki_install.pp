class osx_management::munki_install(
  $software_repo_url = pick($::software_repo_url, "http://scooter.dc1.puppetlabs.net/")
) {
  package { "munkitools":
    ensure   => installed,
    provider => pkgdmg,
    source   => "http://munki.googlecode.com/files/munkitools-0.8.2.1475.0.mpkg.dmg",
  }

  property_list_key { 'SoftwareRepoURL':
    ensure => present,
    path   => '/Library/Preferences/ManagedInstalls.plist',
    key    => 'SoftwareRepoURL',
    value  => $software_repo_url,
  }

  property_list_key { 'LoggingLevel':
    ensure     => present,
    path       => '/Library/Preferences/ManagedInstalls.plist',
    key        => 'LoggingLevel',
    value      => 1,
    value_type => 'integer',
  }

  property_list_key { 'DaysBetweenNotifications':
    ensure     => present,
    path       => '/Library/Preferences/ManagedInstalls.plist',
    key        => 'DaysBetweenNotifications',
    value      => 1,
    value_type => 'integer',
  }

  property_list_key { 'ClientIdentifier':
    ensure     => present,
    path       => '/Library/Preferences/ManagedInstalls.plist',
    key        => 'ClientIdentifier',
    value      => $::hostname,
    value_type => 'string',
  }
}


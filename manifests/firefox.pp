class osx_management::firefox {
  $package_name = 'Firefox%2014.0.1.dmg'

  package { $package_name:
    ensure   => present,
    provider => appdmg,
    source   => "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/14.0.1/mac/en-US/${package_name}",
  }
}

class osx_management::install_printers {
  file {'/private/etc/cups/ppd/Xerox_Phaser_8560MFP.ppd':
    ensure => file,
    mode   => '0655',
    owner  => 'root',
    group  => '_lp',
    source => 'puppet:///modules/osx_management/Xerox_Phaser_8560MFP.ppd',
    before => Printer['Xerox_Phaser_8560MFP'],
  }


  printer { 'Xerox_Phaser_8560MFP':
    ensure      => 'present',
    accept      => 'true',
    description => 'Xerox Phaser 8560MFP',
    enabled     => 'true',
    location    => 'Puppet Labs - Printing and battery station',
    ppd         => '/private/etc/cups/ppd/Xerox_Phaser_8560MFP.ppd',
    uri         => 'socket://printer01.puppetlabs.lan/',
  }
}

class osx_management::mcollective_plugins {

  File {
    owner   => 'root',
    group   => 'wheel',
    require => Package['mcollective'],
    notify  => Service['com.puppetlabs.mcollective'],
  }

  #  I've commented out the following file declarations because the files
  #  haven't been provided with the Module.  You will need to grab them
  #  at https://github.com/glarizza/Custom-Agents and drop them in the 
  #  files/plugins/agent directory.
  #
  #  file { 'munki.rb':
  #    ensure => file,
  #    source => 'puppet:///modules/osx_management/plugins/agent/munki.rb',
  #    path   => '/usr/libexec/mcollective/mcollective/agent/munki.rb',
  #  }
  #
  #  file { 'munki.ddl':
  #    ensure => file,
  #    source => 'puppet:///modules/osx_management/plugins/agent/munki.ddl',
  #    path   => '/usr/libexec/mcollective/mcollective/agent/munki.ddl',
  #  }
  #
  #  file { 'printer.rb':
  #    ensure => file,
  #    source => 'puppet:///modules/osx_management/plugins/agent/printer.rb',
  #    path   => '/usr/libexec/mcollective/mcollective/agent/printer.rb',
  #  }
  #
  #  file { 'printer.ddl':
  #    ensure => file,
  #    source => 'puppet:///modules/osx_management/plugins/agent/printer.ddl',
  #    path   => '/usr/libexec/mcollective/mcollective/agent/printer.ddl',
  #  }
}


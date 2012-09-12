class osx_management::mcollective (
  $stomp_host          = pick($::stomp_host, 'master'),
  $stomp_pool_password = pick($::stomp_pool_password, 'password'),
  $plugin_psk          = pick($::plugin_psk, 'pluginpskvalue')
) {

  File {
    owner => root,
    group => wheel,
  }

  # Obviously, this URL isn't going to exist unless you're me. An MCollective
  # Package can be built with the script in the source code, or by using
  # a task like The Luggage
  package { 'mcollective':
    ensure => installed,
    source => 'http://master/pkgs/MCollective_Installer_Full-1.2.1.dmg',
  }

  package { 'stomp':
    ensure => installed,
    provider => gem,
    before   => Service['com.puppetlabs.mcollective'],
  }

  file { '/etc/mcollective':
    ensure => directory,
    owner  => puppet,
    group  => puppet,
  }

  file { '/etc/mcollective/server.cfg':
    ensure   => file,
    content  => template('osx_management/server.cfg.erb'),
  }

  # This is a bit of 'magic' - it prints out all variables in scope for
  # the node and drops them into a YAML file for MCollective to read.
  # The downside is that this file declaration will change with EVERY
  # Puppet run.  The way Puppet Enterprise does this is to create
  # a cron job that runs 'facter -y -p > /etc/mcollective/facts.yaml'
  file { '/etc/mcollective/facts.yaml':
    ensure   => file,
    content  => inline_template("<%= facts = {}; scope.to_hash.each_pair {|k,v| facts[k.to_s] = v.to_s}; facts.to_yaml %>"),
    notify   => Service['com.puppetlabs.mcollective'],
  }

  file { '/Library/LaunchDaemons/com.puppetlabs.mcollective.plist':
    ensure => file,
    source => 'puppet:///modules/osx_management/com.puppetlabs.mcollective.plist',
  }

  service { 'com.puppetlabs.mcollective':
    enable  => true,
    ensure  => running,
    require => [File['/Library/LaunchDaemons/com.puppetlabs.mcollective.plist'], Package['mcollective']],
  }
}


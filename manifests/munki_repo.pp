# This class requires the vcsrepo module

class osx_management::munki_repo{
  include apache

  apache::vhost {'munki.puppetlabs.lan':
    docroot  => '/opt/munki/repo',
    priority => 10,
    port     => 80,
    require  => Vcsrepo['/opt/munki/repo'],
  }

  # This resource is using our internal Puppet Labs git repo, so you'll
  # want to replace the source parameter with your Munki repository VCS
  # URL
  vcsrepo { '/opt/munki/repo':
    ensure   => present,
    require  => File['/opt/munki'],
    provider => 'git',
    source   => 'git@git.puppetlabs.net:puppetlabs/munki-repo',
  }

  file { '/opt/munki':
    ensure => directory,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

}

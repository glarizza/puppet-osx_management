Facter.add('munki_version') do
  confine :operatingsystem => :darwin
  setcode do
    if File.exists?('/usr/local/munki/managedsoftwareupdate')
      Facter::Util::Resolution.exec('/usr/local/munki/managedsoftwareupdate --version')
    end
  end
end

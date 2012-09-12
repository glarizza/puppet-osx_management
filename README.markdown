##osx_management

This is a module with example manifests for managing OS X Machines. We've
compiled a list of the manifests we use for demoing Puppet and MCollective
with OS X

License
-------
Apache 2.0

Contact
-------
Chris Barker <cbarker@puppetlabs.com>
Gary Larizza <gary@puppetlabs.com>

Manifests
---------

##add_admin_user

Creates a user that will eventually be an Admin. The manifest DOES NOT add
them to the admin or staff group, just creates a user.

##add_local_user

Essentially, the same thing as add_admin_user - creates a local user.

##firefox

Demonstrates ensuring a package with the appdmg provider...in this case, Firefox

##install_printers

Uses the http://forge.puppetlabs.com/mosen/cups module to create printers
on a machine.

##macauth_*

These classes demonstrate using the macauthorization built-in Puppet type
to set values in /etc/authorization

##mcollective

This class installs the MCollective Package (must provide this, or the 
URL to this) and sets up server.cfg. It will also drop an 
/etc/mcollective/facts.yaml file based on variables in scope 
(which can be commented out if need be).

##mcollective_plugins

This class drops in a couple of extra plugins that we created for Mactech
and Macsysadmin (munki and printer agents).  You must get those agents
from https://github.com/glarizza/Custom-Agents and put them in the
files/plugins/agent directory

##munki_install

This class will install the munkitools package from munki.googlecode.com
and set plist values in /Library/Preferences/ManagedInstalls.plist using
the glarizza-property_list_key module from the Puppet Forge
(http://forge.puppetlabs.com/glarizza/property_list_key)

##munki_repo

This class will clone a previously-created Munki repository to /opt/munki.
We use our internal Puppet Labs repo, so ensure that you change the source
parameter and replace it with your VCS repository URL


## Facter Fact - munki_version

This facter fact will execute '/usr/local/munki/managedsoftwareupdate --version'
and return the version to Facter.

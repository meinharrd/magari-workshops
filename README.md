php_sandbox
===========

Vagrant VM with composer git nginx mysql php redis set up for development

Usage
-----

**TODO replace mock section**

* clone repository
* install dependencies
* add your php sources
* start vagrant

### optional/ advanced

* add your sql data
* tweak chef setup (dependencies, configuration, scripts, ..)
* tweak vagrant setup (provider, vm hardware, shared folders)
* simple deployment usign knife-solo

Requirements
------------

* Vagrant 1.3+
* VirtualBox
* ruby gems
* chef solo

VM is tested on *nix with 64bit architecture (recent MacOSX and Ubuntu).
The setup should work under Windows Vista or newer but may have additional dependencies.


Third party utils used
----------------------

* various opscode cookbooks
* foobugs php cookbook (PHP 5-4 and 5.5)
* knife and knife-solo
* librarian-chef

Roadmap
-------

* setup was tested locally but cleanup needed for initial release
* need to document further
* need tp discuss directory layout
* need to discuss nginx sites
* need to discuss data installer
* should migrate some php scripts to bash (low priority)
* should add support for chef environment

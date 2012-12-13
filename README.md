Puppet lsb Module
=================

master branch: [![Build Status](https://secure.travis-ci.org/razorsedge/puppet-lsb.png?branch=master)](http://travis-ci.org/razorsedge/puppet-lsb)
develop branch: [![Build Status](https://secure.travis-ci.org/razorsedge/puppet-lsb.png?branch=develop)](http://travis-ci.org/razorsedge/puppet-lsb)

Introduction
------------

This module installs Linux Standards Base support and allows facter to present the LSB facts lsbdistcodename, lsbdistdescription, lsbdistid, lsbdistrelease, lsbmajdistrelease, and lsbrelease.

Actions:

* Installs the LSB package.

OS Support:

* RedHat family - tested on CentOS 5.5+ and CentOS 6.2+
* SuSE family   - should work
* Debian family - should work

Class documentation is available via puppetdoc.

Examples
--------

    class { 'lsb': }


Notes
-----

* None

Issues
------

* None

TODO
----

* None

License
-------

Please see LICENSE file.

Copyright
---------

Copyright (C) 2012 Mike Arnold <mike@razorsedge.org>

[razorsedge/puppet-lsb on GitHub](https://github.com/razorsedge/puppet-lsb)

[razorsedge/lsb on Puppet Forge](http://forge.puppetlabs.com/razorsedge/lsb)


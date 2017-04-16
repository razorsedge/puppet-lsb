Puppet Linux Standards Base Module
==================================

master branch: [![Build Status](https://secure.travis-ci.org/razorsedge/puppet-lsb.png?branch=master)](http://travis-ci.org/razorsedge/puppet-lsb)
develop branch: [![Build Status](https://secure.travis-ci.org/razorsedge/puppet-lsb.png?branch=develop)](http://travis-ci.org/razorsedge/puppet-lsb)

Introduction
------------

This module installs minimal Linux Standards Base (LSB) support to allow facter to present the LSB facts lsbdistcodename, lsbdistdescription, lsbdistid, lsbdistrelease, lsbmajdistrelease, and lsbrelease.  It can also install full LSB support if required.

Actions:

* Installs the LSB package.

OS Support:

* RedHat family - tested on CentOS 5.5+ and CentOS 6.2+
* SuSE family   - should work
* Debian family - should work

Class documentation is available via puppetdoc.

Examples
--------

Install minimal LSB support for facter facts:

    class { 'lsb': }

Install full LSB support:

    class { 'lsb':
      install_full_lsb_support => true,
    }


Notes
-----

* None

Issues
------

* None

TODO
----

* None

Contributing
------------

Please see CONTRIBUTING.md for contribution information.

License
-------

Please see LICENSE file.

Copyright
---------

Copyright (C) 2012 Mike Arnold <mike@razorsedge.org>

[razorsedge/puppet-lsb on GitHub](https://github.com/razorsedge/puppet-lsb)

[razorsedge/lsb on Puppet Forge](http://forge.puppetlabs.com/razorsedge/lsb)


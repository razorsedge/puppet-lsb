# == Class: lsb::params
#
# This class handles OS-specific configuration of the lsb module.  It
# looks for variables in top scope (probably from an ENC such as Dashboard).  If
# the variable doesn't exist in top scope, it falls back to a hard coded default
# value.
#
# === Authors:
#
# Mike Arnold <mike@razorsedge.org>
#
# === Copyright:
#
# Copyright (C) 2012 Mike Arnold, unless otherwise noted.
#
class lsb::params {
### The following parameters should not need to be changed.
  $ensure = $::lsb_ensure ? {
    undef   => 'present',
    default => $::lsb_ensure,
  }

  # Since the top scope variable could be a string (if from an ENC), we might
  # need to convert it to a boolean.
  $autoupgrade = $::lsb_autoupgrade ? {
    undef   => false,
    default => $::lsb_autoupgrade,
  }
  if is_string($autoupgrade) {
    $safe_autoupgrade = str2bool($autoupgrade)
  } else {
    $safe_autoupgrade = $autoupgrade
  }

  $package_name = $::lsb_package_name ? {
    undef   => $::osfamily ? {
      'RedHat' => 'redhat-lsb',
      'Debian' => 'lsb-release',
      'Suse'   => 'lsb',
      default  => undef,
    },
    default => $::lsb_package_name,
  }

  case $::osfamily {
    'RedHat': { }
    'Debian': { }
    'Suse': { }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}

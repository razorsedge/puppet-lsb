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
  $lsb_ensure = getvar('::lsb_ensure')
  if $lsb_ensure {
    $ensure = $::lsb_ensure
  } else {
    $ensure = 'present'
  }

  # Since the top scope variable could be a string (if from an ENC), we might
  # need to convert it to a boolean.
  $lsb_autoupgrade = getvar('::lsb_autoupgrade')
  if $lsb_autoupgrade {
    $autoupgrade = $::lsb_autoupgrade
  } else {
    $autoupgrade = false
  }
  if is_string($autoupgrade) {
    $safe_autoupgrade = str2bool($autoupgrade)
  } else {
    $safe_autoupgrade = $autoupgrade
  }

  $lsb_install_full_lsb_support = getvar('::lsb_install_full_lsb_support')
  if $lsb_install_full_lsb_support {
    $install_full_lsb_support = $::lsb_install_full_lsb_support
  } else {
    $install_full_lsb_support = false
  }
  if is_string($install_full_lsb_support) {
    $safe_install_full_lsb_support = str2bool($install_full_lsb_support)
  } else {
    $safe_install_full_lsb_support = $install_full_lsb_support
  }

  if $::operatingsystemmajrelease { # facter 1.7+
    $majdistrelease = $::operatingsystemmajrelease
  } elsif $::lsbmajdistrelease {    # requires LSB to already be installed
    $majdistrelease = $::lsbmajdistrelease
  } elsif $::os_maj_version {       # requires stahnma/epel
    $majdistrelease = $::os_maj_version
  } else {
    $majdistrelease = regsubst($::operatingsystemrelease,'^(\d+)\.(\d+)','\1')
  }

  $lsb_package_name = getvar('::lsb_package_name')
  if $lsb_package_name {
    $package_name = $::lsb_package_name
  } else {
    $package_name = $::osfamily ? {
      # Use the minimal redhat-lsb-core package on systems on which it is
      # provided.
      'RedHat' => $::operatingsystem ? {
        /RedHat|CentOS|Scientific|OracleLinux|OEL/ => $majdistrelease ? {
          '4'     => 'redhat-lsb',
          '5'     => 'redhat-lsb',
          default => 'redhat-lsb-core',
        },
        'Fedora'                                   => $::operatingsystemrelease ? {
          /10|11|12|13|14|15|16/ => 'redhat-lsb', # No, I am not going to support versions 1-9.
          default                => 'redhat-lsb-core',
        },
        default                                    => 'redhat-lsb',
      },
      'Debian' => 'lsb-release',
      'Suse'   => 'lsb-release',
      default  => undef,
    }
  }

  $lsb_package_name_full = getvar('::lsb_package_name_full')
  if $lsb_package_name_full {
    $package_name_full = $::lsb_package_name_full
  } else {
    $package_name_full = $::osfamily ? {
      'RedHat' => 'redhat-lsb',
      'Debian' => 'lsb',
      'Suse'   => 'lsb',
      default  => undef,
    }
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

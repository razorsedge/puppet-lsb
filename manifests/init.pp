# == Class: lsb
#
# This module installs minimal Linux Standards Base support and allows facter to
# present the LSB facts lsbdistcodename, lsbdistdescription, lsbdistid,
# lsbdistrelease, lsbmajdistrelease, and lsbrelease.
#
# === Parameters:
#
# [*ensure*]
#   Ensure if present or absent.
#   Default: present
#
# [*autoupgrade*]
#   Upgrade package automatically, if there is a newer version.
#   Default: false
#
# [*package_name*]
#   Name of the minimal package.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# [*package_name_full*]
#   Name of the full package.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# [*install_full_lsb_support*]
#   Whether to use just the minimal LSB packaging if it is available. Otherwise
#   the full LSB software and dependencies will be installed.
#   Default: true
#
# === Actions:
#
# Installs the lsb package.
#
# === Sample Usage:
#
#  # Install minimal LSB support for facter facts:
#  class { 'lsb': }
#
#  # Install full LSB support:
#  class { 'lsb':
#    install_full_lsb_support => true,
#  }
#
# === Authors:
#
# Mike Arnold <mike@razorsedge.org>
#
# === Copyright:
#
# Copyright (C) 2012 Mike Arnold, unless otherwise noted.
#
class lsb (
  $ensure                   = $lsb::params::ensure,
  $autoupgrade              = $lsb::params::safe_autoupgrade,
  $package_name             = $lsb::params::package_name,
  $package_name_full        = $lsb::params::package_name_full,
  $install_full_lsb_support = $lsb::params::safe_install_full_lsb_support
) inherits lsb::params {
  # Validate our booleans
  validate_bool($autoupgrade)
  validate_bool($install_full_lsb_support)

  case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  if $install_full_lsb_support {
    package { 'lsb':
      ensure  => $package_ensure,
      name    => $package_name_full,
    }
  } else {
    package { 'lsb':
      ensure  => $package_ensure,
      name    => $package_name,
    }
  }
}

# == Class: lsb
#
# Full description of class lsb here.
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
#   Name of the package.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# === Actions:
#
# Installs the lsb package.
#
# === Sample Usage:
#
#  # default client
#  class { 'lsb': }
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
  $ensure       = $lsb::params::ensure,
  $autoupgrade  = $lsb::params::safe_autoupgrade,
  $package_name = $lsb::params::package_name
) inherits lsb::params {
  # Validate our booleans
  validate_bool($autoupgrade)

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

  package { 'lsb':
    ensure  => $package_ensure,
    name    => $package_name,
  }
}

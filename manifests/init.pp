# Class: remirror
#
# This module manages creation of a rysyncing service for creating
# internal mirrors of software.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class pkgmirror(
  $user        = $pkgmirror::params::user::user,
  $group       = $pkgmirror::params::user::group,
  $destination = $pkgmirror::params::user::destination
) inherits pkgmirror::params {

  file { $destination:
      ensure => directory,
      owner  => $user,
      group  => $group,
      mode   => '0755',
  }
}

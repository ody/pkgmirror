# Class: pkgmirror::user
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
class pkgmirror::user(
  $user      = $pkgmirror::params::user::user,
  $group     = $pkgmirror::params::user::group,
  $home      = $pkgmirror::params::user::home,
  $tool_dirs = $pkgmirror::params::user::tool_dirs,
  $realize   = true
) inherits pkgmirror::params {

  @user { $user:
    ensure => present,
    gid    => $group,
    home   => $home,
  }

  @group { $group:
    ensure => present,
  }

  @file { $tool_dirs:
      ensure => directory,
      owner => $user,
      group => $group,
      mode  => '0700',
  }

  if realize == true {
    User <| title == $user |>
    Group <| title == $group |>
    File <| title == $tool_dirs |>
  }
}

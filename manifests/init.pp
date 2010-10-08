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
class remirror( $user = "mirror", $group = "nobody", $userdir = "/home/${user}", $base_dest = "/var/remirror" ) {

  user { "${user}":
    ensure => present,
    gid => "${group}",
    homedir => "${userdir}",
  }

  group { "${group}":
    ensure => present,
  }

  file {
    "${userdir}":
      ensure => directory,
      owner => "${user}",
      group => "$group}",
      mode  => 700;
    "${userdir}/local":
      ensure => directory,
      owner => "${user}",
      group => "${group}",
      mode  => 700;
    "${userdir}/local/bin":
      ensure => directory,
      owner  => "${user}",
      group  => "${group}",
      mode   => 700;
    "${base_dest}":
      ensure => directory,
      owner  => "${user}",
      group  => "${group}",
      mose   => 755;
  }
}

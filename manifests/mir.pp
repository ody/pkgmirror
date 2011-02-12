define pkgmirror::mir(
  $syncer = $pkgmirror::params::mir::syncer,
  $ops = $pkgmirror::params::mir::ops,
  $server,
  $path,
  $minute,
  $hour,
  $monthday = $pkgmirror::params::mir::monthday,
  $month = $pkgmirror::params::mir::month,
  $weekday = $pkgmirror::params::mir::weekday,
  $destination = $pkgmirror::params::user::destination,
  $user = $pkgmirror::params::user::user,
  $group = $pkgmmirror::params::user::group,
  $home = $pkgmirror::params::user::home,
  $tool_bin = $pkgmirror::params::user::tool_dirs[1]
  $ensure = "present"
) {

  file {
    "${home}/${tool_bin}/pkgmirror_${name}.bash":
      content => template("${module_name}/pkgmirror_script.erb")
      owner   => $user,
      group   => $group,
      mode    => '0700';
  }
  file {
    "${destination}/${name}":
      ensure  => directory,
      owner   => $user,
      group   => $group,
      mode    => '0755';
  }

  cron { "${name}_pkgmirror":
    command  => "${home}/${tool_bin}/pkgmirror_${name}.sh",
    ensure   => $ensure,
    user     => $user,
    minute   => $minute,
    hour     => $hour,
    monthday => $monthday,
    month    => $month,
    weekday  => $weekday,
  }

}

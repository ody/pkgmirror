define remirror ($syncer = "rsync", $sync_ops = "-rtlvH --progress --stats --delete-after --safe-links", $source_server, $source_path, $sync_minute, $sync_hour, $sync_monthday = "*", $sync_month = "*", $sync_weekday = "*", $destination, $user = "mirror", $group = "nobody", $userdir = "/home/${user}", $ensure = "present") {

  group { "${group}":
    ensure => present,
  }

  user { "${user}":
    gid    => "${group}",
    ensure => present,
    home   => "${userdir}",
  }

  file {
    "${userdir}":
      ensure => directory,
      owner  => "${user}",
      group  => "${group}",
      mode   => 700;
    "${userdir}/local":
      ensure => directory,
      owner  => "${user}",
      group  => "${group}",
      mode   => 700;
    "${userdir}/local/bin":
      ensure => directory,
      owner  => "${user}",
      group  => "${group}",
      mode   => 700;
    "${userdir}/local/bin/remirror_${name}.sh"
      content => template("${module_name}/remirror_script.erb")
      mode    => 700,
      owner   => "${user}",
      group   => "${group}";
  }

  cron { "${name}_syncer":
    command  => "${userdir}/local/bin/remirror_${name}.sh",
    ensure   => "${ensure}",
    user     => "${user}",
    minute   => "${sync_minute}",
    hour     => "${sync_hour}",
    monthday => "${sync_monthday}",
    month    => "${sync_month}",
    weekday  => "${sync_weekday}",
  }

}

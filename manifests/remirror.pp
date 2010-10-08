define remirror ($syncer = "rsync", $sync_ops = "-rtlvH --progress --stats --delete-after --safe-links", $source_server, $source_path, $sync_minute, $sync_hour, $sync_monthday = "*", $sync_month = "*", $sync_weekday = "*", $base_dest = "/var/remirror", $user = "mirror", $group = "nobody", $userdir = "/home/${user}", $ensure = "present") {

  file {
    "${userdir}/local/bin/remirror_${name}.sh":
      content => template("${module_name}/remirror_script.erb")
      owner   => "${user}",
      group   => "${group}",
      mode    => 700;
    "${base_dest}/${name}":
      ensure  => directory,
      owner   => "${user}",
      group   => "${group}",
      mode    => 755;
  }

  cron { "${name}_remirror":
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

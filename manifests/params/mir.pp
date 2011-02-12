class pkgmirror::params::mir {
  $syncer = 'rsync'
  $ops = '-rtlvH --progress --stats --delete-after --safe-links',
  $monthday = '*',
  $month = '*',
  $weekday = '*',
}

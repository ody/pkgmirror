class pkgmirror::params::user {
  $destination = '/var/pkgmirror'
  $user        = 'mirror'
  $group       = 'nobody'
  $home        = "/home/${user}"
  $tool_dirs   = [
                   "${home}/local",
                   "${home}/local/bin",
                 ]
}

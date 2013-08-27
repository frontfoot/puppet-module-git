# Class: git
#
# This class installs git client
#
# Sample Usage:
#  include git::client
#
# To include some dev style handy aliases
#  include git::client::bash_aliases
#

class git::client {
  case $operatingsystem {
    centos, redhat, debian, ubuntu: { $package_name = 'git' }
    default: { $package_name = 'git-core' }
  }

  package { $package_name:
    ensure => installed,
  }
}

class git::client::bash_aliases {

  File {
    owner => root,
    group => root,
    mode  => 644
  }

  file { "/etc/bash_aliases.d":
    ensure => directory
  }

  file { "/etc/bash_aliases.d/git":
    source  => ["puppet:///modules/git/git.aliases.bash"],
    require => File["/etc/bash_aliases.d"]
  }
}

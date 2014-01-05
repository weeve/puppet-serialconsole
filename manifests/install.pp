# Installation class for serialconsole module
class serialconsole::install {
  case $::osfamily {
    /Debian/: {
      file { '/etc/init/ttyS1.conf':
        ensure  => present,
        #source  => 'puppet:///modules/serialconsole/debian-ttyS1.conf',
        content => template('serialconsole/debian-ttyS1.conf.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        notify  => Class['serialconsole::service'],
      }
    }
    /RedHat/: {
      case $::operatingsystemrelease {
        /^5.\d/: {
          file_line { 'enable_serial_console':
            ensure => present,
            line   => "S1:2345:respawn:/sbin/agetty ttyS1 ${serialconsole::params::baud_rate} vt102",
            path   => '/etc/inittab',
          }
        }
        /(^6.\d|^14)/:{
          file { '/etc/init/ttyS1.conf':
            ensure  => present,
            content => template('serialconsole/redhat-ttyS1.conf.erb'),
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            notify  => Class['serialconsole::service'],
          }
        }
        default: {
          # Do nothing as we haven't tested this version of RedHat
        }
      }
    }
  }
    # end class
}

# Service class for serialconsole module
class serialconsole::service {
  # Ensure that the getty for the serial console has been started
  case $::osfamily {
    /Debian/: {
      service { 'ttyS1':
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        require    => Class['serialconsole::install'],
      }
    }
    /RedHat/: {
      case $::operatingsystemrelease {
        /^5.\d/: {
          exec { 'enable_getty_for_serial_console':
            unless  => '/bin/ps auxww | grep ttyS1 | grep -v grep',
            command => '/sbin/init q',
            user    => 'root',
            require => Class['serialconsole::install'],
          }
        }
        /(^6.\d|^14)/: {
          service { 'ttyS1':
            ensure     => running,
            hasstatus  => true,
            hasrestart => true,
            require    => Class['serialconsole::install'],
            start      => '/sbin/initctl start ttyS1',
            stop       => '/sbin/initctl stop ttyS1',
            status     => '/sbin/initctl status ttyS1 | grep "/running" 1>/dev/null 2>&1',
          }
        }
        default: {
          # Do nothing as we haven't tested against this version
        }
      }
    }
    default: {
      # Do nothing as we haven't accommodated for this OS
    }
  }
  # end class
}

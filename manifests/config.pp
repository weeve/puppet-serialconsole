# Configuration class for serialconsole module
class serialconsole::config {
    # Ensure /etc/securetty has ttyS1
    file_line { 'allow_root_login_on_serial_console':
        ensure => 'present',
        line   => 'ttyS1',
        path   => '/etc/securetty',
    }
}

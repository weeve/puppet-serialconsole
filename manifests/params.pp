# Parameters class for serialconsole module
class serialconsole::params {
  # For now, set the baud rate based on the system
  case $::productname {
    /^ProLiant.*/: {
      $baud_rate = '9600'
    }
    /^PowerEdge 1950/: {
      $baud_rate = '57600'
    }
    /^PowerEdge R200/: {
      $baud_rate = '19200'
    }
    /^PowerEdge R\d10/: {
      $baud_rate = '115200'
    }
    /^PowerEdge SC1425/: {
      $baud_rate = '19200'
    }
    /^PowerEdge T\d10/: {
      $baud_rate = '115200'
    }
    default: {
      $baud_rate = '9600'
    }
  }
  # end class
}

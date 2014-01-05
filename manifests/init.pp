# Initialization class for serialconsole module
class serialconsole {
  require serialconsole::params, stdlib
  include serialconsole::install, serialconsole::config, serialconsole::service
}

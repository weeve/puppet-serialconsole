# Puppet module for enabling a serial console on Linux

## Overview

This Puppet module is designed to enable the serial console for an ILO or an
iDRAC.

Made by Jason Wever

This module is released under the terms of the GPLv2 license.

## Requirements

This module requires that the Puppet Labs `stdlib` module be installed prior to usage.

## Usage

Default usage:
```puppet
  class { 'serialconsole': }
```

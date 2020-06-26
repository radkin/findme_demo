#!/usr/bin/env jruby
require_relative '../lib/user_provided_information'

require 'logger'

# Logger#debug, Logger#info, Logger#warn, Logger#error, and Logger#fatal
wrkDir      = "/var/log/findme"
begin
  $LOG = Logger.new("#{wrkDir}/findme.log", 10, 1024000)
rescue Exception => e
  puts "unable to write to #{wrkDir}/findme.log ... writing to stdout"
  $LOG = Logger.new($stderr)
end

#$LOG       = Logger.new($stderr)
#$LOG.level  = Logger::DEBUG
$LOG.level  = Logger::INFO
#$LOG.level  = Logger::ERROR

def main()
  # not doing anything yet
end

main()

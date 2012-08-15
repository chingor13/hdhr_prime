require 'optparse'
require 'yaml'
require 'pp'

if ARGV.length > 0
  device = ARGV.first
else
  device = YAML.load(`ruby devices.rb`).first[:device]  
end

output = `hdhomerun_config #{device} get /sys/debug`
tuners = []
output.split("\n").each do |line|
  if matches = line.match(/^t(\d+):/)
    tuners << matches[1].to_i
  end
end
puts tuners.to_yaml

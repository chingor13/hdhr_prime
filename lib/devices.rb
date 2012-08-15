require 'yaml'

output = `hdhomerun_config discover`
devices = []
output.split("\n").each do |line|
  if matches = line.match(/device\s(\w+).*\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/)
    devices << {
      :device => matches[1],
      :ip => matches[2],
    }
  end
end
puts devices.to_yaml

require 'yaml'

channels = []
freq = nil
cable = nil
irc = nil
while(line = STDIN.gets) do
  if matches = line.match(/SCANNING:\s*(\d+)\s.*us-irc:(\d+),\sus-cable:(\d+)/)
    freq = matches[1].to_i
    irc = matches[2].to_i
    cable = matches[3].to_i
  elsif matches = line.match(/PROGRAM\s*(\d+):\s*(\d+)\s*(.*)/)
    program = matches[1].to_i
    channel = matches[2].to_i
    channel_name = matches[3]

    if channel != 0
      channels << {
        :channel => channel,
        :name => channel_name,
        :cable => cable,
        :frequency => freq,
        :program => program,
        :irc => irc,
      }
    end
  end
end
puts channels.to_yaml

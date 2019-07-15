require "./models/loginfo.rb"

sample_logs = File.readlines "db/webserver.log"

sample_logs.each do |line| 
    line_copy = line
    ip = line.reverse().slice(0, 16).reverse().chop!
    line_copy.slice!(ip)
    route = line_copy.chop!.rstrip

    if ip.length === 15
        Loginfo.new(ip, route)
    end
end
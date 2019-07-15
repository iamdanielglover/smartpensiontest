require "./models/loginfo.rb"

sample_logs = File.readlines "db/webserver.log"

sample_logs.each do |line| 

    arr = line.split(" ")
    route = arr[0]
    ip = arr[1]

    Loginfo.new(ip, route)
end
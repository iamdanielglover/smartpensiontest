def verifyLogInfo
    # /about 543.910.244.929
    routes = "/about /about/2 /contact /help_page/1 /home /index"
        consoleInfo = File.readlines "db/cache.log"

        consoleInfo.each do |line|

            if routes.include? line.split(" ")[0]
                
                f = File.open "db/webserver.log", "a"
                f.puts line
                f.close

            end
        end

end

def openConsole
    $stdout = File.open "db/cache.log", "w"

    while line = $stdin.gets
        puts line
    end

    $stdout.close
    $stdout = STDOUT
end
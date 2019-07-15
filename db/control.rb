def verifyLogInfo(line)
    # /about 543.910.244.929
    routes = "/about /about/2 /contact /help_page/1 /home /index"

    if routes.include? line.split(" ")[0]
        f = File.open "db/webserver.log", "a"
        f.print "\n#{line}"
        f.close
    end
end

def openConsole

    while line = $stdin.gets.chomp
        verifyLogInfo(line)    
    end
    
end

openConsole
require 'pry'
class Loginfo

    attr_accessor :ip, :route

    @@all = []

    def initialize(ip, route)
        @ip = ip
        @route = route
        @@all << self
    end

    def self.all
        @@all
    end

    def self.createOrganisedHash
        list = {
            "/about" => [], 
            "/about/2" => [], 
            "/contact" => [], 
            "/help_page" => [], 
            "/home" => [], 
            "/index" => []
        }
        
        @@all.select do |visit|
            if (visit.route === '/about')
                list["/about"].push(visit)
            elsif (visit.route === '/about/2')
                list["/about/2"].push(visit)
            elsif (visit.route === '/contact')
                list["/contact"].push(visit)
            elsif (visit.route === '/help_page/1')
                list["/help_page"].push(visit)
            elsif (visit.route === '/home')
                list["/home"].push(visit)
            elsif (visit.route === '/index')
                list["/index"].push(visit)   
            end
        end
        
        return list
    end

    def self.orderByTotalVisits
        data = Loginfo.createOrganisedHash
        listByLength = {}
        list = {}
        
        data.each { |key, value| listByLength[key] = value.length }

        listByLength = listByLength.sort_by { |key, value| value }.reverse

        listByLength.each do |element|
            list[element[0]] = element[1]
        end

        return list
    end

    def self.orderByUniqueVisits
        data = Loginfo.createOrganisedHash
        uniqueIpVisits = {}
        list = {}
        
        data.each do |key, value|
             uniqueIpVisits[key] = data[key].uniq! {|line| line.ip}.length
        end
        
        uniqueIpVisits = uniqueIpVisits.sort_by { |key, value| value }.reverse

        uniqueIpVisits.each do |element|
            list[element[0]] = element[1]
        end

        return list
    end

end
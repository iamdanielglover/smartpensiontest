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
        @@all.reduce({}) do |list, visit| 
            list[visit.route] = list[visit.route] || []

            list[visit.route] << visit
            list
        end
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
        list = {}
        superList = {}
        ultimateList = {}
        
        data.each do |key, value|
             list[key] = data[key].uniq {|line| line.ip}
        end

        list.each do |key, value|
            superList[key] = value.length
        end

        superList = superList.sort_by {|key, value| value }.reverse

        superList.each do |element|
            ultimateList[element[0]] = element[1]
        end

        ultimateList
    end

end
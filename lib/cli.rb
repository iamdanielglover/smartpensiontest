require "pry"
require "./db/seeds.rb"

def listWebpagesByPageViews
    data = Loginfo.orderByTotalVisits
    array = data.map { |key, value| "#{key} #{value} visits" }
    array.join(" ")
end

def listWebpagesByUniquePageViews
    data = Loginfo.orderByUniqueVisits
    array = data.map { |key, value| "#{key} #{value} unique views" }
    array.join(" ")
end
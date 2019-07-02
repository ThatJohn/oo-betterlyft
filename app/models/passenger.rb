class Passenger
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def rides
        Ride.all.select do |ride|
            ride.passenger == self
        end
    end

    def drivers
        rides.map do |ride|
            ride.driver
        end
    end

    def total_distance
        totaldistance = 0
        rides.each do |ride|
            totaldistance += ride.distance
        end
        totaldistance
    end

    def self.premium_members
        @@all.select do |passenger|
            passenger.total_distance > 6
        end
    end

end
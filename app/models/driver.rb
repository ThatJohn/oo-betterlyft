class Driver
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
            ride.driver == self
        end
    end

    def passenger_names
        rides.each do |ride|
            ride.passenger
        end
    end

    def self.mileage_cap(distance)
        Ride.all.select do |ride|
           ride.driver if ride.distance > distance
        end
    end

end

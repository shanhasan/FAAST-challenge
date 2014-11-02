class Passenger

	attr_reader :origin, :destination

	def initialize(origin, money=nil)
		@origin = origin
		@money = money
	end

	def has_enough_money?
			@money >= 2
	end

	def destination(destination = :station)
		@destination = destination
	end

 	def touch_at_the_origin_station
 		has_enough_money?
 	end

 	def change_destination(new_destination)
 		@destination = new_destination
 	end


end
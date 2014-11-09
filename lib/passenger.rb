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
 		#should this take away money and regester them as inside the station
 		has_enough_money?
 	end

 	def change_destination(new_destination)
 		@destination = new_destination
 	end

 	def right_station?
 		  self.origin == train.actual_location(station)
 	end

 	def touch_at_the_destination_station

 	end


end
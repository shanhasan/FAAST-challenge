class Train

attr_accessor :itinerary, :location, :in_transit, :carriage

	def initialize(carriages = [])
		@carriages = carriages
		@itinerary = []
		@in_transit = [] 
	end

	def add_carriage(carriage)
		@carriages << carriage
	end

	def has_passengers?
		@carriages.each do |carriage|
		return true if carriage.has_passengers?
		end
		false
	end

	def full?
		@carriages.each do |carriage|
		return false if !carriage.full?
		end
		true
	end
	
	def add_station_to_itinerary(station)
		@itinerary << station
	end

	def passenger_destination_in_itinerary?(passenger)
		@itinerary.include?(passenger.destination)
	end

	def is_boarding_possible_on_this_carriage?
		@carriages.each do |carriage|
		return carriage if !carriage.full?
		end
	end

	def board(passenger,carriage)
		carriage << passenger if passenger_destination_in_itinerary?(passenger)
	end

	def number_of_passengers
		
	end

	def actual_location(station)
		@location = station
	end

	def alight_here
		#this part need to be implemented with a Proc and refactored
		@in_transit = @train.select{|passenger| passenger.destination == @location}
		@train.delete_if{ |passenger| passenger.destination == @location }
	end


end

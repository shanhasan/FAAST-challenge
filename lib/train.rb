class Train

attr_accessor :itinerary, :train, :location, :in_transit

	def initialize(train = [])
		@train = train
		@itinerary = []
		@in_transit = [] 
	end

	def has_passengers?
		!@train.empty?
	end

	def add_station_to_itinerary(station)
		@itinerary << station
	end

	def passenger_destination_in_itinerary?(passenger)
		@itinerary.include?(passenger.destination)
	end

	def board(passenger)
		@train << passenger if passenger_destination_in_itinerary?(passenger)
	end

	def number_of_passengers
		@train.size
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
require './train'
require './passenger'

@giorgia = Passenger.new('waterloo', 2)
@pablo = Passenger.new('southwark', 1)
@giorgia.destination = 'southwark'

@tube = Train.new

@tube.add_station_to_itinerary('southwark')
@tube.add_station_to_itinerary('waterloo')
@tube.add_station_to_itinerary('charing cross')

@tube.actual_location('southwark')

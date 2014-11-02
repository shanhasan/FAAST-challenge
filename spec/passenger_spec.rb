require 'passenger'

describe Passenger  do

	let(:passenger)	                   	                     { Passenger.new(:waterloo, 2)      }
	let(:passenger_without_enough_money)		             { Passenger.new(:waterloo)         }
	let(:money)	                                             {       double :money              } 
        let(:train)				                     {       double :train              }
	let(:station)                                                {       double :station            }


	it 'must have at least £ 2 to travel' do
		expect(passenger).to have_enough_money
	end

	it 'has a origin' do 
		expect(passenger.origin).not_to be nil
	end

	it 'has a destination' do
		expect(passenger.destination).not_to be nil
	end

	it 'will touch at the origin of the journey' do
		expect(passenger).to have_enough_money
		expect(passenger.origin).not_to be nil
		passenger.touch_at_the_origin_station
		expect(passenger.touch_at_the_origin_station).to be true
	end

	it 'can change the destination' do
		expect(passenger.destination).not_to be nil
		expect(passenger.change_destination(:new_destination)).to be (:new_destination)
	end

	# it 'will alight once at destination' do

	# end


	# it 'will transit in the station before touching' do

	# end

	# it 'will touch at the destination of the journey' do

	# end

	

	
end


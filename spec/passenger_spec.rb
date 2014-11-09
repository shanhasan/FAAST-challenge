require 'passenger'

describe Passenger  do


	let(:passenger)	                   	    { Passenger.new(:waterloo, 2)      }
	let(:passenger_without_enough_money)		{ Passenger.new(:waterloo, 1)         }
	let(:money)											        {       double :money              } 
  let(:train)										  	      { 			double :train              }
	let(:station)                           {       double :station            }


	
	context 'passenger attributes' do

		it 'must have at least £ 2 to travel' do
			expect(passenger).to have_enough_money
		end

		it 'cannot travel with less than £ 2' do
			expect(passenger_without_enough_money).not_to have_enough_money
		end

		it 'has a origin' do 
			expect(passenger.origin).not_to be nil
		end

		it 'has a destination' do
			expect(passenger.destination).not_to be nil
		end

	end

	context 'at the origin before boarding' do

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

	end

context 'once at destination' do

		it 'will transit into the station once at destination' do
			expect(station).to receive(:<<).with(passenger)
			passenger.in_transit(station)
			allow(station).to receive(:has_passengers).and_return true
		end

		it 'will touch at the destination of the journey' do
			allow(station).to receive(:<<).with(passenger)
			passenger.in_transit(station)
			expect(station).to receive(:delete_if).and_return(station)
			expect(passenger.touch_at_the_destination(station)).to be(station)
	end

end
	

	
end


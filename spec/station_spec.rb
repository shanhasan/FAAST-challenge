require 'station'

describe Station do 

	let(:station)                    {    Station.new    }
	let(:passenger)                  { double :passenger }
	let(:tube)											 { double :tube}


it 'is empty when built' do 
	expect(station).not_to have_passengers
end

it 'has a location (name)' do
	expect(station).to have_location
end

it 'allows the passengers with enough money to touch at the entrance ' do
	expect(station.station.count).to be (0)
	expect(passenger).to receive(:has_enough_money?)
	station.allow_entrance(passenger)
end

it 'increases number of passengers after having touched' do
	allow(passenger).to receive(:has_enough_money?).and_return(passenger)
	station.allow_entrance(passenger)
	expect{station.allow_entrance(passenger)}.to change{station.station.count}.by 1
end

it 'allows transit in the station once off the train' do
	expect(station.station.count).to eq(0)
	expect(passenger).to receive(:has_enough_money?).and_return(passenger)
	station.allow_entrance(passenger)
	expect(station.station.count).to eq(1)
	expect(tube).to receive(:in_transit)
	station.passenger_in_the_station(tube)
	expect(station.station.count).to be(2)
	#one passenger in transit and one in the station
end




end
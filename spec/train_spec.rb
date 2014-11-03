require 'train'

describe Train do 
     let(:tube)                             {     Train.new     }
     let(:passenger)												{ double :passenger }
     let(:station)                          {  double :station  }

it 'is empty when created' do
	expect(tube).not_to have_passengers
end

it 'does not have an original location when created' do
	expect(tube.location).to be nil
end
	
it 'will have an itinerary'	do
	expect(tube.itinerary).to be_an_instance_of(Array)
end

it 'can add stations to its itinerary' do
	expect(tube.itinerary).to eq([])
	tube.add_station_to_itinerary(station)
	expect{tube.add_station_to_itinerary(station)}.to change{tube.itinerary.count}.by 1
end

it "will know if passenger destination is included in the itinerary" do
	expect(passenger).to receive(:destination).and_return(station)
	tube.add_station_to_itinerary(station)
	expect(tube.passenger_destination_in_itinerary?(passenger)).to be true
end

it 'accept passengers whose destination is in the itinerary' do
	allow(passenger).to receive(:destination).and_return(station)
	tube.add_station_to_itinerary(station)
	tube.board(passenger)
	expect(tube).to have_passengers
end

it 'knows in which station it is' do
	expect(tube.location).to be nil
	tube.actual_location(station)
	expect(tube.location).to eq(station)
end

it 'allows passenger to alight once at destination' do
	allow(passenger).to receive(:destination).and_return(station)
	tube.add_station_to_itinerary(station)
	tube.board(passenger)
	tube.actual_location(station)
	tube.alight_here
	expect(tube).not_to have_passengers
end

it 'keeps the count of total passengers when passengers get on the tube' do
	expect(tube).not_to have_passengers
	5.times {tube.train << passenger}
	expect(tube.number_of_passengers).to eq(5)
end

it 'keeps the count of total passengers when passengers get off the tube' do
	tube.add_station_to_itinerary(station)
	allow(passenger).to receive(:destination).and_return(station)
	5.times { tube.board(passenger) }
	tube.actual_location(station)
	tube.alight_here
	expect(tube.number_of_passengers).to eq(0)
end



# it 'has a default capacity that will depend on the number of carriages (40per carriages)'

# it 'has a limited number of carriages(40 passengers per carriage)'


end
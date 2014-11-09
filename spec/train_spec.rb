require 'train'

describe Train do 

     let(:tube)                             {     Train.new      }
     let(:passenger)												{  double :passenger, destination: "Old Street" }
     let(:station)                          {  double :station   }
     let(:carriage)									       	{  double :carriage , full?: false }

context 'train features' do

	it 'does not have carriages when created' do
		expect(tube.carriages).to eq([])
	end

	it 'is empty when created' do
		expect(tube).not_to have_passengers
	end

	it 'does not have an original location when created' do
		expect(tube.location).to be nil
	end

	it 'is full of passengers when created' do
		expect(tube.full?).to be true
	end

	it "can not be full" do
		tube.add_carriage(carriage)
		expect(tube).not_to be_full
	end

	it "be full" do
		tube.add_carriage(carriage)
		allow(carriage).to receive(:full?).and_return(true)
		expect(tube).to be_full
	end

	it 'can have maximum 3 carriages' do 
		expect(tube.carriages).to eq([])
		tube.add_carriage(carriage)
		expect(tube.carriages.count).to eq(1)
	end

	it 'will have an itinerary'	do
		expect(tube.itinerary).to be_an_instance_of(Array)
	end

end

context 'train interacts with passengers' do

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

	it 'knows in which station it is' do
		expect(tube.location).to be nil
		tube.actual_location(station)
		expect(tube.location).to eq(station)
	end

	it 'checks if the carriage is full before boarding a passenger' do
		tube.add_carriage(carriage)
		expect(carriage).to receive(:full?)
		expect(tube.board_where).to eq(carriage)
	end

	it 'boards a passenger into the carriage' do
		tube.add_carriage(carriage)
		allow(carriage).to receive(:full?).and_return false
		allow(passenger).to receive(:destination).and_return(station)
		tube.add_station_to_itinerary(station)
		expect(tube.passenger_destination_in_itinerary?(passenger)).to be true
		expect(carriage).to receive(:push).with(passenger)
		tube.board(passenger)
	end

	it 'knows which passengers are at there destination' do
		carriage_with_passenger = double :carriage, carriage: [passenger], has_passengers?: true
		tube.add_carriage(carriage_with_passenger)
		tube.location = "Old Street"
		expect(tube.passengers_to_depart).to eq [passenger]
	end

	it 'allows passenger to alight once at destination' do
		carriage_with_passenger = double :carriage, carriage: [passenger], has_passengers?: true
		tube.add_carriage(carriage_with_passenger)
		tube.location = "Old Street"
		expect(tube.passengers_to_depart).to eq [passenger]
		tube.alight_here
		# allow(tube).to receive(:delete_if)
		expect(tube.in_transit).to eq([passenger])
	end

end




end

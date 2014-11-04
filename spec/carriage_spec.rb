require 'carriage'

describe Carriage do

DEFAULT_CAPACITY = 40
let(:carriage)                        {    Carriage.new     } 
let(:passenger)                       {  double :passenger  }

it 'is not full when created' do
	expect(carriage).to be_empty
end

it 'has a default capacity when created' do
	expect(carriage.capacity).to eq(DEFAULT_CAPACITY)
end

it 'has a default capacity that cannot be exceeded' do
	expect(carriage).not_to be_full


end











end
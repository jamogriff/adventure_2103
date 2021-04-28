require './lib/trail'
require './lib/park'

RSpec.describe Park do
  describe 'initialization' do
    park1 = Park.new('Capitol Reef')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

    it 'exists and accesses attributes' do
      expect(park1.name).to eq "Capitol Reef"
      expect(park1.trails).to be_instance_of Array
    end

    it 'can add trails' do
      park1.add_trail(trail1)
      expect(park1.trails.length).to eq 1
    end
  end
end

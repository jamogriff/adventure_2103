require './lib/hiker'
require './lib/park'
require './lib/trail'

RSpec.describe Hiker do
  describe 'initialize packing and recommended trails' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)

    it 'exists and accesses attributes' do
      expect(hiker.name).to eq 'Dora'
      expect(hiker.experience_level).to eq :moderate
      expect(hiker.snacks).to be_instance_of Hash
      expect(hiker.parks_visited).to be_instance_of Array
    end

    it 'can pack snacks' do
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      hiker.pack('water', 1)
      expected = {'water' => 2, "trail mix" => 3}
      expect(hiker.snacks).to eq expected
    end

    it 'can visit parks' do
      hiker.visit(park1)
      expect(hiker.parks_visited.length).to eq 1
    end

    it 'lists possible trails' do
      expect(hiker.possible_trails).to eq [trail2]
    end
  end
end

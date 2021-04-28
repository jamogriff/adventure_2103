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

    it 'knows favorite snack' do
      expect(hiker.favorite_snack).to eq "trail mix"
    end
  end

  describe 'iteration 4' do
    trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
    park = Park.new('Bryce Canyon')
    park.add_trail(trail1)
    park.add_trail(trail2)
    park.add_trail(trail3)
    park.add_trail(trail4)
    hiker1 = Hiker.new('Dora', :moderate)
    hiker2 = Hiker.new('Frank', :easy)
    hiker3 = Hiker.new('Jack', :strenuous)
    hiker4 = Hiker.new('Sally', :strenuous)
    #This visit occurs on June 23, 1980
    hiker1.visit(park)
    #This visit occurs on June 24, 1980
    hiker2.visit(park)
    #This visit occurs on June 24, 1980
    hiker3.visit(park)
    #This visit occurs on June 25, 1980
    hiker4.visit(park)
    #This visit occurs on June 23, 2020
    hiker1.visit(park)
    #This visit occurs on June 24, 2020
    hiker2.visit(park)
    #This visit occurs on June 24, 2020
    hiker3.visit(park)
    #This visit occurs on June 25, 2020
    hiker4.visit(park)

    it 'does not count same park twice' do
      expect(hiker1.parks_visited.length).to eq 1
      expect(hiker2.parks_visited.length).to eq 1
    end
  end
end

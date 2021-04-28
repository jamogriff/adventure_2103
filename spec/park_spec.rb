require './lib/trail'
require './lib/park'
require './lib/hiker'

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

  describe 'the spicy functionality' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)
    hiker = Hiker.new('Dora', :moderate)
    hiker.visit(park1)
    hiker.visit(park2)

    it 'returns trails shorter than' do
      expected = [trail1, trail2]
      expect(park1.trails_shorter_than(2.5)).to eq expected
    end

    it 'calculates hikable miles' do
      expect(park1.hikeable_miles).to eq 7.5
      expect(park2.hikeable_miles).to eq 16.9
    end

    it 'sorts trails by level' do
      expected1 = {
            :easy => ["Grand Wash"],
            :moderate => ["Cohab Canyon"],
            :strenuous => ["Chimney Rock Loop"]
          }

      expected2 = {
            :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
            :easy => ["Rim Trail"]
          }
      expect(park1.trails_by_level).to eq expected1
      expect(park2.trails_by_level).to eq expected2
    end
  end
end

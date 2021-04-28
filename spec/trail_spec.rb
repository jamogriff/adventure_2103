require './lib/trail'

RSpec.describe Trail do
  describe 'initialization' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

    it 'exists and accesses attributes' do
      expect(trail1.name).to eq 'Grand Wash'
      expect(trail1.length).to eq 2.2
      expect(trail1.level).to eq :easy
    end
  end
end

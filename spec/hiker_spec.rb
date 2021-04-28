require './lib/hiker'

RSpec.describe Hiker do
  describe 'initialize and packing' do
    hiker = Hiker.new('Dora', :moderate)

    it 'exists and accesses attributes' do
      expect(hiker.name).to eq 'Dora'
      expect(hiker.experience_level).to eq :moderate
      expect(hiker.snacks).to be_instance_of Hash
    end

    it 'can pack snacks' do
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      hiker.pack('water', 1)
      expected = {'water' => 2, "trail mix" => 3}
      expect(hiker.snacks).to eq expected
    end
  end
end

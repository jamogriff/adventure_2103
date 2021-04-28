require './lib/hiker'

RSpec.describe Hiker do
  describe 'initialize' do
    hiker = Hiker.new('Dora', :moderate)

    it 'exists and accesses attributes' do
      expect(hiker.name).to eq 'Dora'
      expect(hiker.experience_level).to eq :moderate
      expect(hiker.snacks).to be_instance_of Hash
    end
  end
end

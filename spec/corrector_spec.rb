require_relative 'required_files'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  describe '#corrected' do
    context 'when having more than 10 characters' do
      it 'should return a shortened name' do
        expect(@corrector.correct_name('Falconrocket69')).to eq 'Falconrock'
      end
    end

    context 'with downcase first letter' do
      it 'should return a capitalized first letter' do
        expect(@corrector.correct_name('falconrocket69')).to eq 'Falconrock'
      end
    end
  end
end
require_relative 'required_files'

describe Person do
  describe '#instance' do
    context 'when initialized with only age' do
      person = Person.new(age: 17)

      it 'should return an instance of person' do
        expect(person).to be_an_instance_of Person
      end

      it 'should return name unknown' do
        expect(person.name). to eql 'Unknown'
      end
    end

    context 'all parameters given' do
      person = Person.new(name: 'Andy', age: 23, parent_permission: false)

      it 'should return an instance of person' do
        expect(person).to be_an_instance_of Person
      end

      it 'should return name Andy' do
        expect(person.name). to eql 'Andy'
      end

      it 'should return age 23' do
        expect(person.age). to eql 23
      end
    end
  end
  
end
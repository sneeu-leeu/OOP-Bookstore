require_relative 'required_files'

describe Student do
    before :each do 
     @classroom = Classroom.new('A1')
     @student = Student.new(age: 25, classroom: @classroom)
    end 
    describe '#instance' do
        context 'When initialized with age and classroom' do
             it 'should return an instance of student' do
                expect(@student).to be_an_instance_of Student
             end

             it 'should be in a correct classroom' do
                expect(@student.classroom). to eql @classroom
             end
        end     
    end
  
end
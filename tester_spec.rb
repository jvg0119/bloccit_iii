##  delete this file before deploying 


class ClassRoom 
	attr_accessor :students 
	def initialize(students) 
		@students = students 
	end 
   
   def list_student_names 
      @students.map(& :name).join(',') 
   end

end

#student1 = ClassRoom.new("joe")
#p student1.students
#student1.list_student_names

	describe ClassRoom do 
		it 'the list_student_names method should work correctly' do 
		  	#student1 = double
		  	#student2 = double
		  	#allow(student1).to receive(:name) { "Joe" }
		  	#allow(student2).to receive(:name) { "Mike" }

		  	student1 = double(name: "Joe")
		  	student2 = double(name: "Mike")
		  	cr = ClassRoom.new [student1, student2]
		  	expect(cr.list_student_names).to eq("Joe,Mike")
		  end
		end

class School 
  attr_accessor :teacher
  # def initialize(teacher)
  # 	@teacher = teacher
  # end
end

	describe "double" do 
	  it "allows 1" do
	  	teacher = double 
	  	allow(teacher).to receive(:name) { "Josepn" }
	  	expect(teacher).to respond_to(:name)
	  	expect(teacher.name).to eq("Josepn")
	  end
	  it "allows 2" do 
	  	teacher = double(:name => "Joseph")
	  	expect(teacher).to respond_to(:name)
	  	expect(teacher.name).to eq("Joseph")
	  end
	  it "allows 3" do 
	  	teacher = double(:name => "Joseph", :gender => "Male")
	  	expect(teacher.name).to eq("Joseph")
	  	expect(teacher.gender).to eq("Male")
	  end
	  it "allows 4" do 
	  	man = School.new
	  	allow(man).to receive(:teacher) {"test"} # stubbing the attribute
	  	expect(man.teacher).to eq('test')
	  end
	  it "allows 5" do 
	  	man = School.new
	  	#man = double
	  	something = double(:junk)
	  	#allow(something).to receive(:junk)
	  	#allow(man).to receive(:something) { 'anything' } # cannot do
	  end

	end

	describe "message expectation" do
		it "expects 1" do 
			teacher = double
			expect(teacher).to receive(:name) { "Joe" }
			expect(teacher).to respond_to(:name)
			teacher.name
		end
		it "expect 2" do
			teacher = double
			expect(teacher).to receive(:name) { "Joe" }
			expect(teacher).to receive(:gender) { "Male" }
			expect(teacher).to receive(:none)
			teacher.none
			teacher.name
			teacher.gender("OK")  
		end
		it "expect 3" do 
			man = School.new
			allow(man).to receive(:teacher) { 'test' }
			expect(man.teacher).to eq("test")
		end
		it "expect with" do
			teacher = double
			expect(teacher).to receive(:name).with('Jim')
			teacher.name('Jim')
		end
		it "partial double" do 
		#	expect(Time.now.year).to eq(2016)
			time = Time.now
			#allow(time).to receive(:year) { 2000 }
			#expect(time.year).to eq(2000)
			allow(time).to receive(:year) { 2000 }
			expect(time.year).to eq(2000)
		end 
		it "partial" do 
			time = Time.now
			expect(time).to receive(:year).and_return('3000')
			time.year
		end
		it "testing" do 
			customer = double(name: "Joe")
			man = School.new
			#man.teacher = "test"
			allow(man).to receive(:teacher) { customer }
			expect(man.teacher).to eq(customer)
			expect(man.teacher.name).to eq("Joe")
			var = man.teacher
			expect(var.name).to eq("Joe")
		end
		it "testing expectation" do
			person = double( name: "Joe" ) 
			man = School.new
			expect(man).to receive(:teacher) { person }.at_least(2)
			man.teacher
			#man.teacher
			expect(man.teacher.name).to eq("Joe")
			man.teacher
		end

	end











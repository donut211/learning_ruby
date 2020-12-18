##
class Animal
end

#dog is-a Animal
class Dog < Animal

  def initialize(name)
    # Dog has-a name
    @name = name
  end

  def sleep
    puts "This dog is snoring lightly"
  end

  def bark
    puts "Bark, Bark"
  end

  def chase_tail
    puts "this dog is running in a circle, chasing its tail"
  end
end

#Cat is-a animal
class Cat < Animal
  def initialize(name)
    @name = name
  end

  def be_awful
    puts "This cat exists, and is therefore awful!"
  end

  def pur
    puts "Now the cat is purring. Maybe it isn't all that bad..."
  end

  def sleep
    puts "This cat is in it's most natural state: asleep"
  end
end

#a person is-a object
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
    @pet = nil
  end

  attr_accessor :pet

  def breathe
    puts "Taking a deep breath of fresh air!"
  end

  def talk
    puts "A person can most definitely have a conversation"
  end
end

class Employee < Person
  attr_accessor :salary, :job_name, :new_job_name, :new_salary
  def initialize(name, salary, job_name)
    super(name)
    @salary = salary
    @job_name = job_name
  end

  def work
    puts "breaking your back for the man!"
  end

  def quit_job
    puts "Take this job and shove it!"
    @job_name = "unemployed"
    puts "Now you are unemployed!"
    return @job_name
  end

  def get_hired(new_job_name, salary)
    puts "Congratulations on the new job!"
    @job_name = new_job_name
    @salary = salary
  end

  def get_promotion(new_salary)
    @salary = new_salary
  end
end

class Fish
  def swim
    puts "This fish is swimming in circles"
  end

  def eat
    puts "Yum yum!"
  end
end

class Salmon < Fish
  def swim_upstream
    puts "The fish leaps out of the water heading UP the waterfall!"
  end

  def be_delicious
    puts "Turns out this fish tastes delicious if cooked"
  end
end

class Halibut < Fish

  def do_something
    puts "I know nothing of Halibut, I assume they are fish"
  end
end

puts "Meet John! He has a shitty job changing oil. Lets take a look:"
john = Employee.new("John", 19000, "lube-technician")
puts john.name
puts "#{john.salary}" + " dollars a year"
puts john.job_name
puts "john can go to work, like so:"
john.work
puts "john can quit, or get a new job, too:"
john.quit_job
puts "John is now jobless. Here is his new employment status:"
puts john.job_name
puts "But he can get a new job, see:"
john.get_hired("ruby programmer", 30000)
puts "And now he has a new job where he makes more money: "
puts "#{john.job_name}" + " making #{john.salary} dollars a year"
puts "Talk about a pay bump! Now lets watch him work:"
john.work
puts "Good job, John! I think you've earned a promotion: "
john.get_promotion(38000)
puts "#{john.salary} dollars a year"
puts "Wow, nicely done. Now take a deep breath-you've earned it!"
john.breathe #this method is in the parent class "Person". Because employees
             #are people, and John is an employee, John knows how to breath!

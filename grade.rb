class Grade
  include Comparable
  
  attr_accessor :letter, :sign, :grade
  
  def initialize(grade)
    #Separating letter grade and sign and converting grade to be upper case always
    @letter = grade[0].upcase
    if !grade[1].nil?
      @sign = (grade[1] == "+") ? 1: -1 
    else
      @sign = 0
    end
    
    @grade = grade
  end
  
  def <=>(other)
    return other.letter <=> @letter if @letter != other.letter
    @sign <=> other.sign
  end
  
  def to_s
    #Just displaying every grade in uppercase: Grade.new("a+") => "A+"
    grade.upcase
  end
  
end


class Employee
    attr_reader :earnings
  
    def initialize(base_salary = 20000.0)
      @base_salary = base_salary
      @earnings = 0.0
      @base_salary_paid = false
    end
  
    def pay_employee
      unless @base_salary_paid
        @earnings += @base_salary
        @base_salary_paid = true
      end
    end
  
    def new_month
      @base_salary_paid = false
    end
  end
  
  class Manager < Employee
    def initialize(bonus)
      super()
      @bonus = bonus
    end
  
    def pay_employee
      super
      @earnings += @bonus
    end
  end
  
  class Programmer < Employee
    def initialize(percentage)
      super(20000.0 * percentage)
    end
  end
  
  class Team
    def initialize
      @employees = []
    end
  
    def add_member(employee)
      raise "Team is full" if @employees.size >= 2
      @employees << employee
    end
  
    def pay_team
      @employees.each(&:pay_employee)
    end
  
    def new_month
      @employees.each(&:new_month)
    end
  
    def print_earnings
      @employees.each { |employee| puts employee.earnings }
    end
  end
  
  # Test code
  team1 = Team.new
  team2 = Team.new
  
  puts "Enter manager bonus:"
  bonus = gets.to_f
  manager = Manager.new(bonus)
  
  team1.add_member(manager)
  team2.add_member(manager)
  
  puts "Enter programmer percentage:"
  percentage = gets.to_f
  programmer1 = Programmer.new(percentage)
  programmer2 = Programmer.new(percentage)
  
  team1.add_member(programmer1)
  team2.add_member(programmer2)
  
  loop do
    puts "Pay teams for another month? (y/n)"
    answer = gets.chomp
    break if answer.downcase == 'n'
  
    team1.pay_team
    team2.pay_team
    team1.new_month
    team2.new_month
  end
  
  puts "Earnings:"
  team1.print_earnings
  team2.print_earnings
require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees 
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(another_startup)
    self.funding > another_startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "There is no #{title} title"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    employees_salary = @salaries[employee.title]

    if @funding > employees_salary
      employee.pay(employees_salary)
      @funding -= employees_salary
    else
      raise "Insufficient funding to pay #{employee.name} #{employee.title}, only have #{@funding} left"
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee)}
  end

  def average_salary
    total_salary = @employees.inject(0) { |sum, employee| sum + @salaries[employee.title]}
    total_salary / (size * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(another_startup)
    @funding += another_startup.funding
    another_startup.salaries.each do |title, amount| 
      if !@salaries.has_key?(title)
        @salaries[title] = amount
      end
    end
    @employees.push(*another_startup.employees)
    another_startup.close
  end
end

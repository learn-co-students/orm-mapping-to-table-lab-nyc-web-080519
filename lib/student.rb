class Student


  attr_accessor  :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
  end  # ends initialize method

  def self.create_table
    sql = <<-SQL
      CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT );
    SQL
    DB[:conn].execute(sql)

    def self.drop_table
      sql = <<-SQL
        DROP TABLE students;
      SQL
      DB[:conn].execute(sql)
    end  # ends self.drop_table method

    def save
      sql = <<-SQL
        INSERT INTO students (name, grade) VALUES (?, ?);
      SQL

      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end  # ends save method

    def self.create(name:, grade:)
      student = Student.new(name, grade)
      student.save
      student 
    end  # ends create method
  end  # ends create_table method

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
end

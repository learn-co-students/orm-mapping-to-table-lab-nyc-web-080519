class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  


    def self.create_table
        SQL = <<-SQL
        CREATE TABLE IF NOT EXISTS (id = nil)
    end

    def self.drop_table

    end

    def save

    end

    def self.create(name:, grade:)

    end

  
end

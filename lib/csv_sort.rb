require "csv_sort/version"
require "smarter_csv"

module CsvSort

  class Csv  
    def parse_csv_file(csv_file)
      @parsed_csv = SmarterCSV.process(csv_file)
      valid_attendees = [] 

      for row in @parsed_csv
        valid_attendees << is_valid_email(row[:email])
      end
      
      puts valid_attendees
      puts @parsed_csv
    end

    def is_valid_email(email) 
      email = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end
  end
end

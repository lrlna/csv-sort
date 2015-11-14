require "csv_sort/version"
require "smarter_csv"

module CsvSort

  class Csv  
    def parse_csv_file(csv_file)
      # make csv file into an array of hashes
      @parsed_csv = SmarterCSV.process(csv_file)
      valid_attendees = [] 

      # check for email validity
      for row in @parsed_csv
        valid_attendees << is_valid_email(row[:email])
        puts is_valid_email(row[:email])
      end
      
    end

    # regex out the email
    def is_valid_email(email) 
      email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end
  end

  class File_Writer

  end 
end

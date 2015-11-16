require "csv_sort/version"
require "phone"
require "smarter_csv"

module CsvSort

  class Csv  
    def parse_csv_file(csv_file)
      # make csv file into an array of hashes
      @parsed_csv = SmarterCSV.process(csv_file)
      valid = []
      invalid = []

      # check for email validity
      for row in @parsed_csv
        if is_valid_email(row[:email])
          valid << row
        else 
          invalid << row 
        end 
      end
      
      format_valid(valid)
    end

    # regex out the email
    def is_valid_email(email) 
      email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end

    def write_file(rows)
         
    end 

    def format_invalid(invalid)
      write_file(invalid)
    end

    def format_valid(valid)
      # default country code
      Phoner::Phone.default_country_code = "1"
      # parse phone number, format it
      for row in valid 
        # convert some fixnum values
        row[:phone] = row[:phone].to_s if row[:phone].is_a? Fixnum
        ph_number = Phoner::Phone.parse(row[:phone])
        row[:phone] = ph_number.format("(%a) %f %l")
      end

      write_file(valid)
    end

  end

  class File_Writer

  end 
end

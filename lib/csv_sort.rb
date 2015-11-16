require "csv_sort/version"
require "json"
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
      
      valid = JSON.pretty_generate(format_valid(valid))
      valid_filename = File.basename(csv_file, ".csv") + "_valid" + ".json"
      write_file(valid, valid_filename)
    end

    # regex out the email
    def is_valid_email(email) 
      email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end

    # create a file
    def write_file(json, filename)
      fname = filename          
      file_to_be_written = File.open(fname, "w")
      file_to_be_written.puts json
      file_to_be_written.close
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

    end

  end

  class File_Writer

  end 
end

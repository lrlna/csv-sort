require "csv_sort/version"
require "smarter_csv"

module CsvSort

  class Csv  

    def parse_csv_file(csv_file)
      @parsed_csv = SmarterCSV.process(@csv_file)
      puts @parsed_csv
    end
  end
end

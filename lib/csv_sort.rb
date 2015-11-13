require "csv_sort/version"
require "smarter_csv"

module CsvSort

  class Csv  
    def initialize(params)
      @csv_file = params
    end

    def parse_csv_file 
      @parsed_csv = SmarterCSV.process(@csv_file)
    end
  end
end

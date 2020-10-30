require 'csv'

class CsvToHash
  def self.convert(csv_data)
    data = CSV.parse(csv_data, headers: true, col_sep: ";")
    data.map do |item|
      item.to_h
    end
  end
end

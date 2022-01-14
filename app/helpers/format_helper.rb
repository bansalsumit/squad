require_relative '../services/csv_handler.rb'

module FormatHelper
  AVAILABLE_FORMAT = { dollar_format: '$', percent_format: '%' }

  def get_users_data(params)
    params = convert_all_format_to_coma(params)
    csv_data = generate_csv_file_with_combine_data(params)
  end

  def convert_to_comma_separated_data(format_type, str)
    str.gsub(format_type, ',')
  end

  def convert_all_format_to_coma(params)
    params.keys.reduce({}) do |hash, key|
      hash[key] = if check_format_available?(key)
        convert_to_comma_separated_data(AVAILABLE_FORMAT[key], params[key])
      else
        params[key]
      end
      hash
    end
  end

  def check_format_available?(sym)
    AVAILABLE_FORMAT.keys.include?(sym)
  end

  def generate_csv_file_with_combine_data(params)
    params.keys.reduce([]) do |arr, key|
      if check_format_available?(key)
        csv = CsvHandler.new
        csv.read_in_csv_data(params[key])
        arr += csv.users
      end
      arr
    end
  end
end

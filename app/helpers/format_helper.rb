module FormatHelper
  AVAILABLE_FORMAT = { dollar_format: '$', percent_format: '%' }

  def get_csv_file(params)
    params = convert_all_format_to_coma(params)
  end

  def convert_to_comma_separated_data(format_type, str)
    str.gsub(format_type, ', ')
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
end

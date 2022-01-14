module FormatHelper
  AVAILABLE_FORMAT = { dollar: '$', percent: '%' }

  def convert_to_comma(format, str)
    str.gsub(format, ', ')
  end

  def convert_all_format_to_coma(params)
    params.keys.reduce({}) do |hash, key|
      hash[key] = if check_format_available?(key)
        convert_to_comma(AVAILABLE_FORMAT[get_format_name(key).to_sym], params[key])
      else
        params[key]
      end
      hash
    end
  end

  def check_format_available?(sym)
    AVAILABLE_FORMAT.keys.map(&:to_s).include?(get_format_name(sym).to_s)
  end

  def get_format_name(key)
    key.to_s.match(/^[^_]*/).to_s
  end
end

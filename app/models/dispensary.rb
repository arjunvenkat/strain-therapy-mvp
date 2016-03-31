class Dispensary < ActiveRecord::Base
  def formatted_name
    name.present? ? name : llc_name
  end

  def name_with_address
    "#{formatted_name} - #{address}"
  end
end

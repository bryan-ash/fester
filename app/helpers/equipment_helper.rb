module EquipmentHelper

  def equipment_form_path
    @equipment.new_record? ? equipment_path : equipment_instance_path(@equipment)
  end

  def equipment_form_html_options
    @equipment.new_record? ? { :method => :post } : { :method => :put }
  end
  
end

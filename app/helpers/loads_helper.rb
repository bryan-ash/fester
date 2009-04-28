module LoadsHelper
  
  def add_slot_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :slots, :partial => 'slot', :object => Slot.new
    end
  end
  
end

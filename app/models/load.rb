class Load < ActiveRecord::Base

  belongs_to :aircraft
  has_many   :slots, :dependent => :destroy

  after_update :save_slots
  
  def new_slot_attributes=(slot_attributes)
    slot_attributes.each do |attributes|
      slots.build(attributes)
    end
  end

  def existing_slot_attributes=(slot_attributes)
    slots.reject(&:new_record?).each do |slot|
      attributes = slot_attributes[slot.id.to_s]
      if attributes
        slot.attributes = attributes
      else
        slots.delete(slot)
      end
    end
  end
  
  def save_slots
    slots.each do |slot|
      slot.save(false)
    end
  end
  
  def aircraft_name
    aircraft.name if aircraft
  end

  def aircraft_name=(name)
    self.aircraft = Aircraft.find_or_create_by_name(name) unless name.blank?
  end

end

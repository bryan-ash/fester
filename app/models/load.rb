class Load < ActiveRecord::Base

  belongs_to :aircraft
  belongs_to :pilot, :class_name => "Account"
  has_many   :slots, :dependent => :destroy

  before_save  :create_aircraft_from_name
  after_update :save_slots
  
  def new_slot_attributes=(slot_attributes)
    slot_attributes.each do |attributes|
      slots.build(attributes) unless attributes[:account_id].blank?
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

  def create_aircraft_from_name
    create_aircraft(:name => new_aircraft_name) unless new_aircraft_name.blank?
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

  def new_aircraft_name
    @new_aircraft_name || other_aircraft_name
  end

  def new_aircraft_name=(name)
    @new_aircraft_name = name
  end

  def pilot_name
    pilot.name if pilot
  end

  def other_aircraft_name
    aircraft_name unless our_aircraft?
  end

  def our_aircraft?
    aircraft.ours if aircraft
  end

end

class Load < ActiveRecord::Base

  belongs_to :aircraft
  has_many   :slots, :dependent => :destroy

  def slot_attributes=(slot_attributes)
    slot_attributes.each do |attributes|
      slots.build(attributes)
    end
  end

  def aircraft_name
    aircraft.name if aircraft
  end


end

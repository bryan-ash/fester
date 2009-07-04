class User < ActiveRecord::Base

  acts_as_authentic

  belongs_to :role

  before_create :set_default_role

  def permitted_to_see?(name)
    case name
    when 'Manifest', 'Transactions', 'Accounts', 'Maintenance'
      ['Manager', 'Manifester'].include? role.name

    else
      true
    end

  end

  private

  def set_default_role
    self.role = Role.default
  end


end

class User < ActiveRecord::Base

  acts_as_authentic

  belongs_to :role
  has_one    :account
  
  before_create :set_default_role

  def self.find_using_perishable_token(token)
    # this should probably be fed back into Authlogic
    first(:conditions => ["LOWER(users.perishable_token) = ?", token.downcase])
  end
  
  def self.find_by_smart_case_login_field(login)
    field = (login =~ Authlogic::Regex.email ? 'email' : 'username')
    first(:conditions => ["LOWER(users.#{field}) = ?", login.downcase])
  end

  def permitted_to_see?(name)
    case name
    when 'Manifest', 'Transactions', 'Accounts', 'Maintenance'
      ['Manager', 'Manifester'].include? role.name

    else
      true
    end
  end

  def entry_page_path
    if role.name == 'Default' then
      '/users/current/edit'
    else
      '/loads'
    end
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)  
  end

  private

  def set_default_role
    self.role = Role.default
  end

end

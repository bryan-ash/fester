# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_controller?(name)
    controller.controller_name == name
  end

  def controller_for?(menu)
    case menu
    when /Main Menu/
      current_controller?('loads') or 
        current_controller?('transactions') or 
        current_controller?('accounts')
      
    when /Maintenance/
      current_controller?('aircrafts') or 
        current_controller?('equipment') or 
        current_controller?('jump_types') or 
        current_controller?('payment_methods') or 
        current_controller?('csv_imports')
    end
  end

  def maintenance_submenu_items
    [{ :label => 'Aircraft',        :controller => 'aircrafts',       :path => aircrafts_path },
     { :label => 'Equipment',       :controller => 'equipment',       :path => {:controller => :equipment, :action => :index} },
     { :label => 'Jump Types',      :controller => 'jump_types',      :path => jump_types_path },
     { :label => 'Payment Methods', :controller => 'payment_methods', :path => payment_methods_path },
     { :label => 'Import CSV',      :controller => 'csv_imports',     :path => new_csv_import_path }]
  end

  def main_submenu_items
    [{ :label => 'Manifest',     :controller => 'loads',        :path => loads_path },
     { :label => 'Transactions', :controller => 'transactions', :path => transactions_path },
     { :label => 'Accounts',     :controller => 'accounts',     :path => accounts_path }]
  end

end

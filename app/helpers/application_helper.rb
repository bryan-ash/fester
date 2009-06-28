# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_controller?(name)
    controller.controller_name == name
  end

  def controller_for?(menu)
    case menu
    when 'Maintenance'
      [ 'aircrafts',
        'equipment',
        'jump_types',
        'payment_methods',
        'csv_imports' ].include? controller.controller_name

    when 'Manifest'
      current_controller? 'loads'
      
    when 'Import CSV'
      current_controller? 'csv_imports'
      
    else
      current_controller?(menu.downcase.gsub(/ /,'_').pluralize)
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

  def set_focus_to_id(id)
    <<-EMBED_SCRIPT
      <script type="text/javascript">
        window.onload = function() {
          document.getElementById('#{id}').focus();
      }
      </script>
    EMBED_SCRIPT
  end

end

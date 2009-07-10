# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_controller?(name)
    controller.controller_name == name
  end

  def current_page_for_top_menu_item?(label)
    case label
    when 'Manifest'
      current_controller? 'loads'
      
    when 'Transactions'
      current_controller? 'transactions'
      
    when 'Accounts'
      current_controller? 'accounts' unless my_account_topmenu_active?
      
    when 'Maintenance'
      maintenance_topmenu_active?

    when 'My Account'
      my_account_topmenu_active?
      
    end
  end
  
  def current_page_for_submenu_item?(label)
    case label
    when 'Account Status'
      current_controller? 'accounts'

    when 'Edit Profile'
      current_controller? 'users'

    when 'Import CSV'
      current_controller? 'csv_imports'

    else
      current_controller? label.downcase.gsub(/ /, '_').pluralize
    end
  end
  
  def topmenu_active?(submenu_items)
    submenu_items.collect { |item| item[:path] }.each { |path| return true if current_page?(path) }
    return false
  end

  def my_account_topmenu_active?
    topmenu_active? my_account_submenu_items
  end

  def maintenance_topmenu_active?
    topmenu_active?(maintenance_submenu_items) ||
      current_controller?('aircrafts') ||
      current_controller?('equipment') ||
      current_controller?('jump_types') ||
      current_controller?('payment_methods')
  end

  def topmenu_items
    [{ :label => 'Manifest',     :path => loads_path },
     { :label => 'Transactions', :path => transactions_path },
     { :label => 'Accounts',     :path => accounts_path },
     { :label => 'Maintenance',  :path => aircrafts_path }]
  end

  def maintenance_submenu_items
    [{ :label => 'Aircraft',        :path => aircrafts_path },
     { :label => 'Equipment',       :path => { :controller => :equipment, :action => :index} },
     { :label => 'Jump Types',      :path => jump_types_path },
     { :label => 'Payment Methods', :path => payment_methods_path },
     { :label => 'Import CSV',      :path => new_csv_import_path }]
  end

  def my_account_submenu_items
    [{ :label => 'Account Status', :path => { :controller => :accounts, :action => :my_accounts } },
     { :label => 'Edit Profile',   :path => edit_user_path(:current) }]
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

  def link_to_new(label, path)
    content_tag :div, :class => 'link_to_new_block' do
      content_tag :span, :class => 'link_to_new_button' do
        link_to label, path, :class => 'link_to_new_content'
      end
    end
  end

end

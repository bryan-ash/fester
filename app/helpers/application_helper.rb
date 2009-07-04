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
      
    when 'Login'
      current_controller? 'user_sessions'
      
    when 'My Account'
      current_controller? 'users'
      
    else
      current_controller?(menu.downcase.gsub(/ /,'_').pluralize)
    end
  end

  def maintenance_submenu_items
    [{ :label => 'Aircraft',        :path => aircrafts_path },
     { :label => 'Equipment',       :path => { :controller => :equipment, :action => :index} },
     { :label => 'Jump Types',      :path => jump_types_path },
     { :label => 'Payment Methods', :path => payment_methods_path },
     { :label => 'Import CSV',      :path => new_csv_import_path }]
  end

  def topmenu_items
    [{ :label => 'Manifest',     :path => loads_path },
     { :label => 'Transactions', :path => transactions_path },
     { :label => 'Accounts',     :path => accounts_path },
     { :label => 'Maintenance',  :path => aircrafts_path }]
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

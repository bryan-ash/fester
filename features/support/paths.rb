module NavigationHelpers
  # Maps a static name to a static route.
  #
  # This method is *not* designed to map from a dynamic name to a 
  # dynamic route like <tt>post_comments_path(post)</tt>. For dynamic 
  # routes like this you should *not* rely on #path_to, but write 
  # your own step definitions instead. Example:
  #
  #   Given /I am on the comments page for the "(.+)" post/ |name|
  #     post = Post.find_by_name(name)
  #     visit post_comments_path(post)
  #   end
  #
  def path_to(page_name)
    case page_name
    
    when /home/
      root_path
    
    when /aircraft/
      aircrafts_path
    
    when /accounts/
      accounts_path

    when /CSV import/
      new_csv_import_path
      
    when /jump types/
      jump_types_path

    when /edit my profile/
      edit_user_path(:current)
      
    when /equipment/
      '/equipment'

    when /manifest/, /loads/
      loads_path

    when /new load/
      new_load_path

    when /new transaction/
      'transactions/new'
      
    when /payment methods/
      payment_methods_path

    when /show my account/
      my_accounts_path
      
    when /transactions/
      transactions_path
      
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)

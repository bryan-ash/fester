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
    
    when /the home page/
      root_path
    
    when /the aircraft page/
      aircrafts_path
    
    when /the accounts page/
      accounts_path
    
    when /the jump types page/
      jump_types_path

    when /the equipment page/
      '/equipment'

    when /the loads page/
      loads_path

    when /the new transaction page/
      'transactions/new'
      
    when /the payment methods page/
      payment_methods_path

    when /the transactions page/
      transactions_path
      
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)

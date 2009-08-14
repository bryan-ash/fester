namespace :yougo do

  desc 'Populate database with default data'
  task :load_default_data => :environment do
    ['Default', 'Manifester', 'Manager'].each do |role_name|
      Role.find_or_create_by_name role_name
    end
  end

end

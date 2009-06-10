
require 'fastercsv'

class Account < ActiveRecord::Base

  has_many :transactions
  
  def self.pilots
    find_all_by_pilot(true)
  end

  def self.create_from_csv(csv_file)
    FasterCSV.parse(csv_file.read, :headers => true).each do |row|
      create(:name       => row[2],
             :created_at => row[1],
             :email      => row[13],
             :contact    => row[12],
             :dob        => row[17])
    end
  end

  def roles
    roles = []
    roles << 'Jumper' if   jumper
    roles << 'Pilot'  if   pilot
    roles << 'None' unless roles.any?
    roles
  end

  def balance
    Transaction.sum_for_account(id)
  end

end


require 'fastercsv'

class Account < ActiveRecord::Base

  has_many :transactions

  Name       = 2
  Created_At = 1
  Email      = 13
  Contact    = 12
  DOB        = 17
  
  def self.pilots
    find_all_by_pilot(true)
  end

  def self.create_from_csv(csv_file)
    FasterCSV.parse(csv_file.read, :headers => true).each do |row|
      account = find_or_create_by_name row[Name]
      
      account.update_attributes(:created_at => row[Created_At],
                                :email      => row[Email],
                                :contact    => row[Contact],
                                :dob        => row[DOB])
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

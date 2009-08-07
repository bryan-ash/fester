
require 'fastercsv'
require 'string'

class CsvFile

  attr_accessor :path

  Name       = 2
  Created_At = 1
  Email      = 13
  Contact    = 12
  DOB        = 17
  Balance    = 6
  
  def initialize(path = "")
    @path = path
  end

  def import_accounts
    begin
      Account.transaction do
        FasterCSV.parse(@path.read, :headers => true).each do |row|
          account = Account.find_or_create_by_name row[Name].reverse_first_last_names
          
          account.update_attributes(:created_at => row[Created_At],
                                    :email      => row[Email],
                                    :contact    => row[Contact],
                                    :dob        => row[DOB])
     
          account.transactions.create(:amount => row[Balance],
                                      :date   => Date.today,
                                      :notes  => 'Imported balance')
        end
      end
      indication = true
    rescue
      indication = false
    end
    return indication
  end

end

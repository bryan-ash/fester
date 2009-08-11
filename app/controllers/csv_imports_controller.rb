class CsvImportsController < ApplicationController

  def new
    @csv_file = CsvFile.new
  end

  def create
    unless params[:csv_file]
      flash[:error] = "You must provide a file path"
      redirect_to new_csv_import_url
      return false
    end

    csv_file = CsvFile.new(params[:csv_file][:path])
    if csv_file.import_accounts
      flash[:notice] = "Accounts succesfully created"
      redirect_to accounts_url
    else
      flash[:error] = "CSV Import Failed"
      redirect_to new_csv_import_url
    end
  end

end

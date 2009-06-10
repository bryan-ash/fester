class CsvImportsController < ApplicationController

  def new
    @csv_file = Struct.new(:path)
  end

  def create
    csv_file = params[:csv_file][:path]  
    if Account.create_from_csv(csv_file)  
      flash[:notice] = "Accounts succesfully created"  
      redirect_to accounts_path
#     else  
#       flash[:error] = "Failed to import file"  
#       render new_csv_imports_path
    end
  end

end

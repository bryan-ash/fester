class BalanceTransfersController < ApplicationController

  autocomplete_for :account, :name, :order => 'name ASC'
  
  def create
    @balance_transfer = BalanceTransfer.new
    render
  end

  def update
    balance_transfer = BalanceTransfer.new
    balance_transfer.from_account_name = params[:balance_transfer][:from_account_name]
    balance_transfer.to_account_name   = params[:balance_transfer][:to_account_name]
    balance_transfer.amount            = params[:balance_transfer][:amount]
    balance_transfer.date              = params[:balance_transfer][:date]

    if balance_transfer.save
      flash[:notice] = "Balance transfer successfull"
      redirect_to transactions_path
    end

  end

end

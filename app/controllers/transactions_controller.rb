class TransactionsController < ApplicationController

  autocomplete_for :account, :name, :order => 'name ASC'
  
  def index
    @transactions = Transaction.all :order => 'updated_at DESC'

    respond_to do |format|
      format.html
      format.xml  { render :xml => @transactions }
    end
  end

  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @transaction }
    end
  end

  def new
    @transaction = Transaction.new
    @balance_transfer = BalanceTransfer.new
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @transaction }
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        flash[:notice] = 'Transaction was successfully created.'
        format.html { redirect_to transactions_path }
        format.xml  { render :xml => @transaction, :status => :created, :location => @transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        flash[:notice] = 'Transaction was successfully updated.'
        format.html { redirect_to transactions_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(transactions_url) }
      format.xml  { head :ok }
    end
  end
end

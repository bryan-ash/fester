class PaymentMethodsController < ApplicationController

  def index
    @payment_methods = PaymentMethod.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @payment_methods }
    end
  end

  def show
    @payment_method = PaymentMethod.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @payment_method }
    end
  end

  def new
    @payment_method = PaymentMethod.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @payment_method }
    end
  end

  def edit
    @payment_method = PaymentMethod.find(params[:id])
  end

  def create
    @payment_method = PaymentMethod.new(params[:payment_method])

    respond_to do |format|
      if @payment_method.save
        flash[:notice] = 'Payment Method was successfully created.'
        format.html { redirect_to payment_methods_path }
        format.xml  { render :xml => @payment_method, :status => :created, :location => @payment_method }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @payment_method = PaymentMethod.find(params[:id])

    respond_to do |format|
      if @payment_method.update_attributes(params[:payment_method])
        flash[:notice] = 'Payment Method was successfully updated.'
        format.html { redirect_to payment_methods_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment_method = PaymentMethod.find(params[:id])
    @payment_method.destroy

    respond_to do |format|
      format.html { redirect_to(payment_methods_url) }
      format.xml  { head :ok }
    end
  end
end

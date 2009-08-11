class LoadsController < ApplicationController

  def index
    @loads = Load.all :order => 'date DESC, number DESC'

    respond_to do |format|
      format.html
      format.xml  { render :xml => @loads }
    end
  end

  def show
    @load = Load.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @load }
    end
  end

  def new
    @load = Load.new
    6.times { @load.slots.build }

    respond_to do |format|
      format.html
      format.xml  { render :xml => @load }
    end
  end

  def edit
    @load = Load.find(params[:id])
  end

  def create
    @load = Load.new(params[:load])

    respond_to do |format|
      if @load.save
        flash[:notice] = 'Load was successfully created.'
        format.html { redirect_to loads_url }
        format.xml  { render :xml => @load, :status => :created, :location => @load }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @load.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    params[:load][:existing_slot_attributes] ||= {}
    
    @load = Load.find(params[:id])

    respond_to do |format|
      if @load.update_attributes(params[:load])
        flash[:notice] = 'Load was successfully updated.'
        format.html { redirect_to loads_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @load.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @load = Load.find(params[:id])
    @load.destroy

    respond_to do |format|
      format.html { redirect_to(loads_url) }
      format.xml  { head :ok }
    end
  end
end

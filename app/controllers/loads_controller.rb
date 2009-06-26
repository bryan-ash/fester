class LoadsController < ApplicationController

  # GET /loads
  # GET /loads.xml
  def index
    @loads = Load.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loads }
    end
  end

  # GET /loads/1
  # GET /loads/1.xml
  def show
    @load = Load.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @load }
    end
  end

  # GET /loads/new
  # GET /loads/new.xml
  def new
    @load = Load.new
    6.times { @load.slots.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @load }
    end
  end

  # GET /loads/1/edit
  def edit
    @load = Load.find(params[:id])
  end

  # POST /loads
  # POST /loads.xml
  def create
    @load = Load.new(params[:load])

    respond_to do |format|
      if @load.save
        flash[:notice] = 'Load was successfully created.'
        format.html { redirect_to(@load) }
        format.xml  { render :xml => @load, :status => :created, :location => @load }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @load.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loads/1
  # PUT /loads/1.xml
  def update
    params[:load][:existing_slot_attributes] ||= {}
    
    @load = Load.find(params[:id])

    respond_to do |format|
      if @load.update_attributes(params[:load])
        flash[:notice] = 'Load was successfully updated.'
        format.html { redirect_to(@load) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @load.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.xml
  def destroy
    @load = Load.find(params[:id])
    @load.destroy

    respond_to do |format|
      format.html { redirect_to(loads_url) }
      format.xml  { head :ok }
    end
  end
end

class JumpTypesController < ApplicationController
  # GET /jump_types
  # GET /jump_types.xml
  def index
    @jump_types = JumpType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jump_types }
    end
  end

  # GET /jump_types/1
  # GET /jump_types/1.xml
  def show
    @jump_type = JumpType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jump_type }
    end
  end

  # GET /jump_types/new
  # GET /jump_types/new.xml
  def new
    @jump_type = JumpType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jump_type }
    end
  end

  # GET /jump_types/1/edit
  def edit
    @jump_type = JumpType.find(params[:id])
  end

  # POST /jump_types
  # POST /jump_types.xml
  def create
    @jump_type = JumpType.new(params[:jump_type])

    respond_to do |format|
      if @jump_type.save
        flash[:notice] = 'JumpType was successfully created.'
        format.html { redirect_to(@jump_type) }
        format.xml  { render :xml => @jump_type, :status => :created, :location => @jump_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jump_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jump_types/1
  # PUT /jump_types/1.xml
  def update
    @jump_type = JumpType.find(params[:id])

    respond_to do |format|
      if @jump_type.update_attributes(params[:jump_type])
        flash[:notice] = 'JumpType was successfully updated.'
        format.html { redirect_to(@jump_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jump_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jump_types/1
  # DELETE /jump_types/1.xml
  def destroy
    @jump_type = JumpType.find(params[:id])
    @jump_type.destroy

    respond_to do |format|
      format.html { redirect_to(jump_types_url) }
      format.xml  { head :ok }
    end
  end
end

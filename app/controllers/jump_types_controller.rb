class JumpTypesController < ApplicationController

  def index
    @jump_types = JumpType.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @jump_types }
    end
  end

  def show
    @jump_type = JumpType.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @jump_type }
    end
  end

  def new
    @jump_type = JumpType.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @jump_type }
    end
  end

  def edit
    @jump_type = JumpType.find(params[:id])
  end

  def create
    @jump_type = JumpType.new(params[:jump_type])

    respond_to do |format|
      if @jump_type.save
        flash[:notice] = "Jump Type '#{@jump_type.name}' was created."
        format.html { redirect_to jump_types_path }
        format.xml  { render :xml => @jump_type, :status => :created, :location => @jump_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jump_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @jump_type = JumpType.find(params[:id])

    respond_to do |format|
      if @jump_type.update_attributes(params[:jump_type])
        flash[:notice] = "Jump Type '#{@jump_type.name}' was updated."
        format.html { redirect_to jump_types_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jump_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @jump_type = JumpType.find(params[:id])
    @jump_type.destroy

    flash[:notice] = "Jump Type '#{@jump_type.name}' was deleted"
    
    respond_to do |format|
      format.html { redirect_to(jump_types_url) }
      format.xml  { head :ok }
    end
  end
end

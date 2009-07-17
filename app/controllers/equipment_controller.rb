class EquipmentController < ApplicationController

  def index
    @equipment = Equipment.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @equipment }
    end
  end

  def show
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @equipment }
    end
  end

  def new
    @equipment = Equipment.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @equipment }
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def create
    @equipment = Equipment.new(params[:equipment])

    respond_to do |format|
      if @equipment.save
        flash[:notice] = "Equipment '#{@equipment.name}' was created."
        format.html { redirect_to equipment_path }
        format.xml  { render :xml => @equipment, :status => :created, :location => @equipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        flash[:notice] = "Equipment '#{@equipment.name}' was updated."
        format.html { redirect_to(equipment_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    flash[:notice] = "Equipment '#{@equipment.name}' was deleted"
    
    respond_to do |format|
      format.html { redirect_to(equipment_url) }
      format.xml  { head :ok }
    end
  end
end

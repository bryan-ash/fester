class JavascriptsController < ApplicationController

  def manifest_events
    @jump_types = JumpType.all_by_name

    respond_to do |format|
      format.js { render :layout => false }
    end
  end

end

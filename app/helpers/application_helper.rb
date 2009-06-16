# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_controller?(name)
    controller.controller_name == name
  end

end

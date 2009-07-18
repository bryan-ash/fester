module LoadsHelper
  
  def add_slot_link(name)
    content_tag :div, :class => 'round_button_block' do
      content_tag :span, :class => 'round_button_button' do
        link_to_function name, nil, :class => 'round_button_content' do |page|
          page.insert_html :bottom, :slots, :partial => 'slot', :object => Slot.new
        end
      end
    end
  end
  
  def set_focus_to_first_aircraft
    <<-EMBED_SCRIPT
      <script type="text/javascript">
        $(document).ready(function () {
          $(".aircraft:first").focus();
        });
      </script>
    EMBED_SCRIPT
  end

end

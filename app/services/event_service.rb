# We handle all out events here
# Note: here must be only event and triggers, no implementation
class EventService
  class << self
    def new_shop_registered(shop)
      # TODO: process async
      shop.create_popup_config
      ScriptTagService.insert_script(shop)
    end


    def new_sign_in(shop)
      SlotItems::Default.create_slot_items(shop)
      ScriptTagService.check_or_insert_tag(shop)
    end

  end
end

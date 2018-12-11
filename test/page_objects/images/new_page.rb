module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :image_url
        element :tag_list
      end

      element :error_message, locator: '#error_explanation ul li'

      def create_image!(url: nil, tags: nil)
        image_url.set(url) if url.present?
        tag_list.set(tags) if tags.present?
        node.click_button('Save Image')
        window.change_to(ShowPage, NewPage)
      end
    end
  end
end

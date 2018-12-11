module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '#TODO', item_locator: '#TODO', contains: ImageCard do
        def view!
          # TODO
        end
      end

      def add_new_image!
        node.click_on('Link to submit new image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags:nil)
        images.any? do |image|
          image.url == url &&
            ((tags.present? && image.tags == tags) || tags.nil?)
        end
      end

      def clear_tag_filter!
        # TODO
      end
    end
  end
end

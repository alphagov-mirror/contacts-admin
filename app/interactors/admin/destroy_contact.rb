require "contacts/publisher"

module Admin
  class DestroyContact
    def initialize(contact)
      @contact = contact
    end

    def destroy
      @contact.transaction do
        # Overwrite with a gone item in content-store
        presenter = ContactGonePresenter.new(@contact)
        ::Contacts::Publisher.publish(@contact.link, presenter)

        # Remove from site search
        rummager_id = @contact.link.gsub(%r{^/}, '')
        ::Contacts.rummager_client.delete_document("contact", rummager_id)

        # Remove from our database
        @contact.destroy
      end
    end
  end
end

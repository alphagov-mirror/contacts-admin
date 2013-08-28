class Contact < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :contact_group

  has_many :offices, dependent: :destroy, inverse_of: :contact

  has_many :related_content_links, inverse_of: :contact, dependent: :destroy
  has_many :contact_form_links, inverse_of: :contact

  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  has_many :email_addresses, inverse_of: :contact, dependent: :destroy
  has_many :post_addresses, inverse_of: :contact, dependent: :destroy

  serialize :keywords, Array

  def to_s
    description
  end
end

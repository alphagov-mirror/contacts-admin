class ContactGroupDecorator < Draper::Decorator
  delegate_all

  decorates_association :offices
  decorates_association :questions

  def to_s
    source.title
  end
end
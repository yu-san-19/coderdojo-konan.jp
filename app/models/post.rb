class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  
  def should_generate_new_friendly_id?
    slug_changed? || super
  end
end

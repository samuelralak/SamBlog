class Post < ActiveRecord::Base
	extend FriendlyId
	belongs_to :admin, inverse_of: :posts

	friendly_id :title, use: :slugged

	validates :title, :content, :slug, :admin, presence: true
end

class Product < ActiveRecord::Base
	belongs_to :store
	validates :name, :price, :description, presence: true
	validates :price, numericality: { greater_than: 0}
end

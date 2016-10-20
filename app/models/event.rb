class Event < ActiveRecord::Base

	belongs_to :join 
	has_many :comments, dependent: :destroy
end

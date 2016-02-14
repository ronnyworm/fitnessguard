class Track < ActiveRecord::Base
	belongs_to :starting_point

	validates :name, presence: true
	validates :km, presence: true
	validates :map_link, presence: true
end

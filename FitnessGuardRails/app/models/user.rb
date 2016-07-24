class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :run

  def all_time_km
  	sum = 0

  	all_runs = Run.all

  	all_runs.each do |r|
  		if r.all_participants.include? self.name
  			sum += r.km.round(1) unless r.km.nil?
  		end
  	end

  	sum
  end
end

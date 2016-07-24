class ActivityController < ApplicationController
  def index
  end

  def add
    return if not current_user or not current_user.email == "mail@ronnyworm.de"

  	y = params["date"]["Datum(1i)"].to_i
  	m = params["date"]["Datum(2i)"].to_i
  	d = params["date"]["Datum(3i)"].to_i
  	@activity = Activity.new(date: Date.new(y,m,d), activityname_id: params["activityname_id"].to_i)

  	if @activity.save
  		redirect_to root_path, :notice => "Aktivität erfolgreich gespeichert"
  	else
  		redirect_to root_path, :notice => "Aktivität konnte nicht gespeichert werden"
  	end

  end
end

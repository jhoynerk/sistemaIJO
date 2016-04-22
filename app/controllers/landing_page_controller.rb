class LandingPageController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
    @activities = Activity.all
  end

  def mensual
    @events = Event.all
    @activities = Activity.all
  end
end

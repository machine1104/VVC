class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.first(6)
  end

  def about; end

  def contatti; end
end

module AnnouncementsHelper
  def get_coordinates(pos)
    res = Geocoder.search(pos)
    res.first.coordinates
  end
end

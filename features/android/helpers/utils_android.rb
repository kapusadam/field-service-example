require 'location-one'

module FieldService
  module AndroidHelpers

    def enter_text(uiquery, text)
      query(uiquery, {:setText => text})
    end

    def set_user_location(destination)
      location = LocationOne::Client.location_by_place(destination)
      raise "Unable to find location #{destination}" unless location

      set_gps_coordinates(location.latitude, location.longitude)
    end

  end
end

World(FieldService::AndroidHelpers)
require 'calabash-cucumber/core'
require 'calabash-cucumber/location'
module FieldService
  module IOSHelpers
    include Calabash::Cucumber::Location

    def enter_text(field, text, options={:wait_for_keyboard => true})
      touch(field)
      await_keyboard unless options[:wait_for_keyboard] == false
      keyboard_enter_text(text)
    end

    def set_user_location(destination)
      location = LocationOne::Client.location_by_place(destination)
      raise "Unable to find location #{destination}" unless location

      set_location(:place => destination)
    end

  end
end

World(FieldService::IOSHelpers)

require 'rspec'
require 'spec_helper'
require 'fileutils'
require 'set'
require 'pry'
require 'calabash-cucumber'


describe 'Field Service Example' do

  context("Fieldservice.iOS.app") do

    include Calabash::Cucumber::Operations


    before do
      ENV['RESET_BETWEEN_SCENARIOS']='1'
      ENV['DEVICE']='ipad'
      ENV['CALABASH_FULL_CONSOLE_OUTPUT']='false'
      path = 'FieldService.iOS/bin/iPhoneSimulator/Debug/FieldServiceiOS.app'
      ENV['APP_BUNDLE_PATH']=path
      ENV['OS']='ios6'
      ENV['DEVICE_TARGET']='simulator'

      @launcher = Calabash::Cucumber::Launcher.new
      @launcher.relaunch

    end

    after do
      @launcher.stop
    end

    it 'should not crash when I login' do


      enter('nat@xamarin.com', :mark => 'Username')
      enter('xamurai', :mark => 'Password')
      screenshot_embed(:label => 'Login', :name =>'Login')


      touch_transition("button marked:'Log In'",
                       "navigationItemView marked:'Assignments'")

      screenshot_embed(:label => 'Assignments', :name =>'Assignments')



    end

  end


end

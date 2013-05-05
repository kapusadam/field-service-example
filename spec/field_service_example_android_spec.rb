require 'rspec'
require 'spec_helper'
require 'fileutils'
require 'set'
require 'pry'
require 'calabash-android'


describe 'Field Service Android Example' do

  context('FieldService.Android') do

    include Calabash::Android::Operations


    def keyboard_enter_text(s)
      s.split().each_with_index do |token, index|
        system("#{default_device.adb_command} shell input keyevent 62") unless index == 0
        system("#{default_device.adb_command} shell input text #{token}")
      end
    end

    def app_installed?(package_name)
      installed_apps = `#{default_device.adb_command} shell pm list packages`.split("\n").map { |item| item.chomp.sub("package:", "") }
      installed_apps.include? package_name
    end



    before do

      @app_path = app_path = 'FieldService.Android/FieldService.Android.apk'
      build_test_server_if_needed(app_path)
      test_server_path = test_server_path(app_path)
      test_server_port = '34777'
      ENV['MAIN_ACTIVITY'] = main_activity(app_path)
      ENV['APP_PATH'] = app_path
      ENV['TEST_APP_PATH'] = test_server_path
      ENV['TEST_SERVER_PORT']= test_server_port
      ENV['SCREENSHOT_VIA_USB']='true'
      serial = ENV["ADB_DEVICE_ARG"] #nil is default serial
      @default_device = Calabash::Android::Operations::Device.new(self, serial, test_server_port, app_path, test_server_path)


      unless app_installed?('FieldService.Android')
        puts 'Installing app...'
        install_app(test_server_path)
        install_app(app_path)
      end


      start_test_server_in_background


    end

    after do
      shutdown_test_server
    end

    it 'Android should not crash when I login' do

      touch ("EditText id:'userName'")
      keyboard_enter_text('nat@xamarin.com')

      touch ("EditText id:'password'")
      keyboard_enter_text('xamurai')

      screenshot_embed(:label => 'Login', :name =>'Login')

      touch("button marked:'Log In'")

      wait_for_elements_exist(["textview text:'Miguel de Icaza'"], :timeout => 15)

      screenshot_embed(:label => 'Assignments', :name =>'Assignments')

    end

  end


end

require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
end

Before do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline
    scenario = scenario.scenario_outline
  end



  unless app_installed?('FieldService.Android')
    $stdout.write 'Initial app and test-server install'
    reinstall_apps
  end

=begin
  log "New scenario - reinstalling apps"
  uninstall_apps
  install_app(ENV["TEST_APP_PATH"])
  install_app(ENV["APP_PATH"])
=end



  feature_name = scenario.feature.title
  if FeatureNameMemory.feature_name != feature_name
    FeatureNameMemory.feature_name = feature_name
    FeatureNameMemory.invocation = 1

    clear_app_data
  else
    FeatureNameMemory.invocation += 1
  end
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end

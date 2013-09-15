AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
  FeatureNameMemory.installed = false
end

Before do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline
    scenario = scenario.scenario_outline
  end

  unless FeatureNameMemory.installed
    $stdout.write 'Initial app and test-server install... '
    reinstall_apps
    FeatureNameMemory.installed = true
  end

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
  @installed = false
  attr_accessor :feature_name, :installed, :invocation
end

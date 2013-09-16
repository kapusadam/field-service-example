AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
  FeatureNameMemory.installed = false
end

Before do |scenario|
  unless FeatureNameMemory.installed
    $stdout.write 'Initial app and test-server install... '
    reinstall_apps
    FeatureNameMemory.installed = true
  end

end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  @installed = false
  attr_accessor :feature_name, :installed, :invocation
end

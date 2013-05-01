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

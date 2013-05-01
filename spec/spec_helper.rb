require 'rspec'
require 'pry'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end


## Called when Calabash wants to generate a screenshot
def embed(path, mime, label)
  puts "Screenshot #{label} at #{path}"
end

def enter(text, spec, touch_options={}, wait_options={})
  mark_or_nil = spec[:mark]
  query_or_nil = spec[:query]
  if text.nil? || text.empty? || (not text.is_a?(String))
    raise ArgumentError, "text to enter must be a non empty string (Was: #{text})"
  end

  if mark_or_nil.nil? && query_or_nil.nil?
    raise ArgumentError, 'either :mark or :query must be specified for enter'
  end
  uiquery = mark_or_nil ? "view marked:'#{mark_or_nil}'" : query_or_nil


  touch(uiquery, touch_options)

  await_keyboard

  keyboard_enter_text text

end
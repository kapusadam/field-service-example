require 'calabash-android/abase'

class LoginScreen < Calabash::ABase

  def trait
    "button marked:'Log In'"
  end

  def login(user)
    touch ("EditText id:'userName'")

    keyboard_enter_text user[:email]

    touch ("EditText id:'password'")
    keyboard_enter_text user[:password]

    touch(trait)

    assignments = page(AssignmentsScreen)

    begin
      assignments.await(:timeout => 20)
    rescue
      self
    end

  end

end
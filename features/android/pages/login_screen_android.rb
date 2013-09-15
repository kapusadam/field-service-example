require 'calabash-android/abase'

class LoginScreen < Calabash::ABase
  include FieldService::AndroidHelpers

  def login(user)

    enter_text(username_field(), user[:email])

    enter_text(password_field(), user[:password])

    touch(login_button)

    assignments = page(AssignmentsScreen)

    begin
      assignments.await(:timeout => 20)
    rescue
      self
    end

  end

  def login_button
    trait
  end

  def trait
    "button marked:'Log In'"
  end

  def username_field
    "EditText id:'userName'"
  end

  def password_field
    "EditText id:'password'"
  end


end
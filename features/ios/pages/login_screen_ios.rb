require 'calabash-cucumber/ibase'

class LoginScreen < Calabash::IBase

  def trait
    "button marked:'Log In'"
  end

  def login(user)
    tap "Username"
    await_keyboard
    keyboard_enter_text user[:email]

    done
    keyboard_enter_text user[:password]

    tap('Log In')

    wait_for_elements_do_not_exist(['activityIndicatorView'])

    assignments = page(AssignmentsScreen)

    begin
      assignments.await
    rescue
      self
    end

  end

end
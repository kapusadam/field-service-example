module LoginEntryPoints

  def login(options)
    user = options[:as]
    @screen = @screen.login(user)
  end

  def to_assignments(options)
    await(LoginScreen)
    login(options)
  end

  def assert_login_error_message
    check_element_exists("* marked:'Invalid credentials'")
  end

end


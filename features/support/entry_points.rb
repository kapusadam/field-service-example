require_relative './login_entry_points'
require_relative './assignments_entry_points'


module EntryPoints
  include LoginEntryPoints
  include AssignmentsEntryPoints

  def await(screen)
    @screen = page(screen).await
  end


  def assert_not_on_screen(screen)
    if @screen.is_a?(screen)
        raise "Expected to not be on #{screen.class}"
    end
  end

  def assert_screen(screen)
    unless @screen.is_a?(screen)
      raise "Expected #{screen} screen but was #{@screen.class}"
    end
  end

end



World(EntryPoints)
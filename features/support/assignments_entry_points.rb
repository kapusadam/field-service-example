module AssignmentsEntryPoints

  #{:number => assignment_no, :title => assignment_title, :status => :active}
  def assert_assignment(assignment)
    @screen.assert_assignment(assignment)
  end

  def tap_assignment(assignment)
    @screen = @screen.tap_assignment(assignment)
  end

  def tap_and_store_assignment(assignment)
    @assignment = assignment
    tap_assignment(assignment)
  end

  def tap_record_for_assignment(assignment)
    @screen.tap_record_for_assignment(assignment)
  end

  def wait_for_assignment_details(assignment=nil)
    assignment ||= @assignment
    raise 'No current assignment' if assignment.nil?

    @screen.wait_for_assignment_details(assignment)
  end

  def check_timer_starts_ticking
    wait_for(:timeout => 10,
             :retry_frequency => 0.5) do
      time = @screen.current_timer_time
      $stdout.write '.'
      h,m,s = time.split(":")
      s.to_i>=5
    end
    puts ""
  end

end

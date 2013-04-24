require 'zeus/parallel_tests'

ENV['GUARD_NOTIFY'] = 'true'
ENV['GUARD_NOTIFICATIONS'] = "---\n- :name: :terminal_notifier\n  :options: {}\n"

class CustomPlan < Zeus::ParallelTests::Rails
  # Your custom methods go here
end

Zeus.plan = CustomPlan.new

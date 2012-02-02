require_relative '../lib/core/classes/task.rb'
require_relative '../lib/core/listmanager/text_list_manager.rb'
require_relative '../lib/core/tasks/add_task.rb'

class AddTaskTests
  def initialize
    @task_items = get_dummy_tasks
  end

  def can_add_a_task_to_global_with_category
    manager = TextListManager.new(@task_items)
    adder = AddTask.new(manager)
    adder.setproperties('"task 4" "cat2"')
    adder.execute()
    item = manager.get_task_by_id(4)
    status = item != nil
    print_test_result("can add a task to global", status)
  end
  
  def can_add_a_task_to_global_without_category
    manager = TextListManager.new(@task_items)
    adder = AddTask.new(manager)
    adder.setproperties('"task 4"')
    adder.execute()
    item = manager.get_task_by_id(4)
    status = item != nil
    print_test_result("can add a task to global", status)
  end

  private
  def print_test_result(msg, status)
    puts("Test: #{msg} - Status: #{status}")
  end

  private
  def get_dummy_tasks
    array = Array.new(3)
    array[0] = Task.create(1, "task 1", "cat1", "2012-01-26")
    array[1] = Task.create(2, "task 2", "cat1", "2012-01-27")
    array[2] = Task.create(3, "task 3", "cat2", "2012-01-28")

    array
  end
end

adder_tests = AddTaskTests.new
adder_tests.can_add_a_task_to_global_with_category
adder_tests.can_add_a_task_to_global_without_category

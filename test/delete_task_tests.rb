require_relative '../lib/core/classes/task.rb'
require_relative '../lib/core/listmanager/text_list_manager.rb'
require_relative '../lib/core/tasks/delete_task.rb'

class DeleteTaskTests
  def initialize
    @task_items = get_dummy_tasks
  end

  def can_delete_a_task_from_global
    manager = TextListManager.new(@task_items)
    deleter = DeleteTask.new(manager)
    deleter.setproperties("3")
    deleter.execute()
    status = manager.all.length == 2
    print_test_result("can delete an item", status)
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

deleter_tests = DeleteTaskTests.new
deleter_tests.can_delete_a_task_from_global

require 'Date'
require_relative '../lib/core/classes/task.rb'
require_relative '../lib/core/listmanager/text_list_manager.rb'
require_relative '../lib/core/tasks/mark_task.rb'

class MarkTaskTests
  def initialize
    @task_items = get_dummy_tasks
  end

  def can_mark_a_task
    manager = TextListManager.new(@task_items)
    old_task = manager.get_task_by_id(2)
    marker = MarkTask.new(manager)
    marker.setproperties("2")
    marker.execute()
    new_task = manager.get_task_by_id(2)
    status = new_task.gettaskcompleteddate == Date.today.to_s
    print_test_result("can mark a task as completed", status)
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

mark_tests = MarkTaskTests.new
mark_tests.can_mark_a_task

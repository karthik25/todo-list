require_relative '../lib/core/classes/task.rb'
require_relative '../lib/core/listmanager/text_list_manager.rb'

class TextListManagerTests
  def initialize
    array = get_dummy_tasks

    @task_items = array
    @manager = TextListManager.new(@task_items)
  end

  def test_all_items
    items = @manager.all
    status = items.length == 3
    print_test_result("has 3 tasks", status)

    item = @manager.get_task_by_id(1)
    status = item.gettaskname == "task 1"
    print_test_result("has a task a with id 1 and name task 1", status)
 end

  def test_get_one_item
    item = @manager.get_task_by_id(3)
    status = item.gettaskname == "task 3"
    print_test_result("has a task a with id 3 and name task 3", status)
  end

  def test_if_cat1_has_2_items
    items = @manager.by_category("cat1")
    status = items.length == 2
    print_test_result("has 2 task with category as cat1", status)
  end

  def can_add_a_task
    task = Task.create(4, "task 4", "cat 2", "1/28/2012")
    @manager.add_task(task)
    items = @manager.all
    status = items.length == 4
    print_test_result("has 4 tasks", status)
  end

  def can_delete_a_task
    @manager.delete_task(4)
    items = @manager.all
    status = items.length == 3
    print_test_result("has 3 tasks", status)
  end

  def can_mark_task_as_completed
    @manager.mark_task(3, '1/28/2012')
    item = @manager.get_task_by_id(3)
    status = item.gettaskcompleteddate == '1/28/2012'
    print_test_result("has a task with completed date as 1/28/2012", status)
  end

  def can_unmark_task_as_not_completed
    @manager.unmark_task(3)
    item = @manager.get_task_by_id(3)
    status = item.gettaskcompleteddate == nil
    print_test_result("has a task with completed date as nil", status)
  end

  private
  def get_dummy_tasks
    array = Array.new(3)
    array[0] = Task.create(1, "task 1", "cat1", "2012-01-26")
    array[1] = Task.create(2, "task 2", "cat1", "2012-01-27")
    array[2] = Task.create(3, "task 3", "cat2", "2012-01-28")

    array
  end

  private
  def print_test_result(msg, status)
    puts("Test: #{msg} - Status: #{status}")
  end
end

manager = TextListManagerTests.new
manager.test_all_items
manager.test_get_one_item
manager.test_if_cat1_has_2_items
manager.can_add_a_task
manager.can_delete_a_task
manager.can_mark_task_as_completed
manager.can_unmark_task_as_not_completed

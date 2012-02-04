require './commandprocessor.rb'

class CommandProcessorTests
  def can_identify_a_add
    command = 'add "task 1" "cat1"'
    processor = Commandprocessor.new(nil)
    exectable_command = processor.get_command(command)
    status = exectable_command.class.to_s == "AddTask"
    print_test_result("can generate add task type", status)
  end

  def can_identify_add_params
    command = 'add "task 1" "cat1"'
    processor = Commandprocessor.new(nil)
    exectable_command = processor.get_command(command)
    params = exectable_command.getproperties
    status = params[0] == 'task 1'
    print_test_result("can generate add task type with task name param", status)
    status = params[1] == 'cat1'
    print_test_result("can generate add task type with category name param", status)
  end

  def can_identify_a_delete
    command = 'delete 2'
    processor = Commandprocessor.new(nil)
    exectable_command = processor.get_command(command)
    status = exectable_command.class.to_s == "DeleteTask"
    print_test_result("can generate delete task type", status)
  end

  def can_identify_delete_params
    command = 'delete 2'
    processor = Commandprocessor.new(nil)
    exectable_command = processor.get_command(command)
    params = exectable_command.getproperties
    status = params[0] == '2'
    print_test_result("can generate delete task type with id param", status)
  end
  
  def can_generate_a_mark_task
    command = 'mark 2'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.class.to_s == "MarkTask"
    print_test_result("can generate mark task type", status)
  end

  def can_generate_mark_task_with_params
    command = 'mark 2'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.getproperties[0] == "2"
    print_test_result("can generate mark task type with id param", status)
  end

  def can_generate_an_unmark_task
    command = 'unmark 2'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.class.to_s == "UnmarkTask"
    print_test_result("can generate unmark task type", status)
  end

  def can_generate_unmark_task_with_params
    command = 'unmark 2'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.getproperties[0] == "2"
    print_test_result("can generate an unmark task type with id param", status)
  end

  def can_generate_a_list_task_default
    command = 'list all'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.class.to_s == "ListTask"
    print_test_result("can generate a list task", status)
  end

  def can_generate_a_list_task_with_props
    command = 'list all'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.getproperties[0] == "all"
    print_test_result("can generate a list task with prop as all", status)
  end

  def can_generate_a_list_task_with_props_type2
    command = 'list cat1'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command.getproperties[0] == "cat1"
    print_test_result("can generate a list task with prop as cat1", status)
  end

  def can_identify_invalid_type
    command = '\'sometype'
    processor = Commandprocessor.new(nil)
    executable_command = processor.get_command(command)
    status = executable_command == nil
    print_test_result("can identify a nil type", status)
  end

  private
  def print_test_result(msg, status)
    puts("Test: #{msg} - Status: #{status}")
  end

end

cmdproc = CommandProcessorTests.new
cmdproc.can_identify_a_add
cmdproc.can_identify_add_params
cmdproc.can_identify_a_delete
cmdproc.can_identify_delete_params
cmdproc.can_generate_a_mark_task
cmdproc.can_generate_mark_task_with_params
cmdproc.can_generate_an_unmark_task
cmdproc.can_generate_unmark_task_with_params
cmdproc.can_generate_a_list_task_default
cmdproc.can_generate_a_list_task_with_props
cmdproc.can_generate_a_list_task_with_props_type2
cmdproc.can_identify_invalid_type

require './commandprocessor.rb'
require_relative './core/listmanager/text_list_manager.rb'
require_relative './core/listmanager/yaml_list_manager.rb'
require_relative './core/classes/Task.rb'
require_relative './core/tasks/task_base.rb'
require_relative './core/tasks/help_task.rb'

class Main
  attr_reader :list_manager, :cmd_processor, :manager_type_id

  def initialize(manager_type)
    # cannot just do manager_type_id = manager_type for simple data types
    setmanagertype(manager_type)
  end

  def setup
    if (@manager_type_id == 1)
      @list_manager = TextListManager.new(nil)
    else
      @list_manager = YamlListManager.new(nil)
    end
    @cmd_processor = Commandprocessor.new(@list_manager)
  end

  def start
    str = ''
    while str != 'exit'
      command_str = gets.chomp
      
      finish if command_str == 'exit'

      command = @cmd_processor.get_command(command_str)
      if command != nil && command.has_valid_params
        command.execute
      else
        puts("unknown command/incorrect parameters")
        helper = HelpTask.new
        helper.display_help(command_str)
      end
      puts("\n")
    end
  end

  private
  def finish
    @list_manager.write_changes
    exit
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
  def setmanagertype(value)
    @manager_type_id = value
  end
end

main = Main.new(2)
main.setup
main.start

require './core/tasks/task_base.rb'
require './core/listmanager/text_list_manager.rb'

class DeleteTask < TaskBase
  attr_reader :manager

  def initialize(list_manager)
    @manager = list_manager
  end
  
  def has_valid_params
    @props == nil || @props.length == 1
  end

  def execute
    result = true

    if (@props == nil)
      result = @manager.delete_tasks
    else
      result = @manager.delete_task(@props[0])
    end

    msg = "deleted the selected task from the to-do list"
    msg = "deleted all the tasks from the to-do list" if @props == nil

    puts(msg) if result
    puts("unable to find the task") unless result
  end
end

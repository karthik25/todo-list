require './core/tasks/task_base.rb'
require './core/listmanager/text_list_manager.rb'

class UnmarkTask < TaskBase
  attr_reader :manager

  def initialize(list_manager)
    @manager = list_manager
  end

  def has_valid_params
    @props != nil && @props.length == 1
  end

  def execute
    id = @props[0].to_i
    result = @manager.unmark_task(id)
    puts("marked the selected test as not complete") if result
    puts("unable to find the selected task") if !result
  end
end

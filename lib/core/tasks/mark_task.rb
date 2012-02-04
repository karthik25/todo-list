require 'Date'
require './core/tasks/task_base.rb'
require './core/listmanager/text_list_manager.rb'

class MarkTask < TaskBase
  attr_reader :manager

  def initialize(list_manager)
    @manager = list_manager
  end

  def has_valid_params
    @props != nil && @props.length == 1
  end

  def execute
    id = @props[0].to_i    
    result = @manager.mark_task(id, Date.today.to_s)
    puts("marked the selected task as complete") if result
    puts("unable to find the task") if !result
  end
end

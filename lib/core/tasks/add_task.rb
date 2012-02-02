require 'date'
require './core/tasks/task_base.rb'
require './core/listmanager/text_list_manager.rb'

class AddTask < TaskBase
  attr_reader :manager
  
  def initialize(list_manager)
    @manager = list_manager
  end

  def has_valid_params
    @props.length == 1 || @props.length == 2
  end

  def execute
    category = "default"
    category = @props[1] if @props[1] != nil
    id = @manager.all.length + 1
    date = Date.today.to_s
    task = Task.create(id, @props[0], category, date)
    @manager.add_task(task)
    puts "added the task to the to-do list"
  end
end

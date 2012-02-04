require 'shellwords'
require './core/tasks/add_task.rb'
require './core/tasks/list_task.rb'
require './core/tasks/delete_task.rb'
require './core/tasks/mark_task.rb'
require './core/tasks/unmark_task.rb'
require './core/helpers/string_splitter.rb'

class Commandprocessor
  attr_reader :manager
  def initialize(list_manager)
    @manager = list_manager
  end

  def get_command(command)
    type_captures = Stringsplitter.split_string(command)
    
    type = nil

    if type_captures != nil
      type = create_type(type_captures.first)
      type.setproperties(get_props(type_captures)) if type != nil
    end

    type
  end

  private
  def get_props(words)
    words.shift(1)
    if words.length == 0
      nil
    else
      words
    end
  end

  private
  def create_type(type)
    task = nil
    begin
      type_name = type.capitalize + "Task"
      task = Object::const_get(type_name).new(@manager)
    rescue

    end
    task
  end
end

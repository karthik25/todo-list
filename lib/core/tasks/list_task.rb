require './core/tasks/task_base.rb'
require './core/listmanager/text_list_manager.rb'

class ListTask < TaskBase
    attr_reader :manager
    
    def initialize(list_manager)
      @manager = list_manager
    end

    def has_valid_params
      @props == nil || @props.length == 1
    end

    def execute
      category = nil
      category = @props[0] if @props != nil
      list_of_tasks = nil
      if category == nil
        list_of_tasks = @manager.all
      else
        list_of_tasks = @manager.by_category(category)
      end

      print_tasks(list_of_tasks)
    end

    def print_tasks(list)
      printf("%-10s %-20s %-20s %-15s %-15s %-15s\n\n", "task id", "task name", "category", "added date", "completed date", "task status")
      for task in list do
        task_status = 'incomplete'
        task_status = 'complete' if task.gettaskcompleteddate != nil && task.gettaskcompleteddate != ''

        printf("%-10s %-20s %-20s %-15s %-15s %-15s\n", task.gettaskid, task.gettaskname, task.gettaskcategory, task.gettaskaddeddate, task.gettaskcompleteddate, task_status)
      end
    end
  end

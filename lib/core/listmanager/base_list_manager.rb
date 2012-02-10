class BaseListManager
    @@file_name = 'tasks.tsk'
    @@file_name_yml = 'tasks.yml.tsk'

    def initialize(task_items)
      @task_items = task_items
      @task_items = get_task_items if @task_items == nil
    end

    def get_task_by_id(id)
      @task = nil
      for t in @task_items do
        if (t.gettaskid.to_i == id.to_i)
          @task =  t
        end
      end
      @task
    end

    def all
      @task_items
    end

    def by_category(category)
      tasks_by_cat = []
      for task in @task_items do
        if task.gettaskcategory == category
          tasks_by_cat << task
        end
      end
      tasks_by_cat
    end

    def add_task(task)
      @task_items << task
    end

    def delete_tasks
      @task_items = []
      true
    end

    def delete_task(id)
      status = false

      status = true if get_task_by_id(id.to_i) != nil
      @task_items.delete_if() { |task|
        task.gettaskid.to_i == id.to_i
       }

      return status
    end

    def mark_task(id, date)
      @task_items.each { |item|
        if item.gettaskid.to_s == id.to_s
          item.settaskcompleteddate(date)
          return true
        end
      }
      return false
    end

    def unmark_task(id)
      @task_items.each { |task|
        if task.gettaskid.to_s == id.to_s
          task.settaskcompleteddate(nil)
          return true
        end
      }
      return false
    end

    def write_changes

    end

    def get_task_items

    end
end

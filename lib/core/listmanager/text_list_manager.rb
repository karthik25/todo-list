class TextListManager
    @@file_name = 'tasks.tsk'

    def initialize(task_items)
      @task_items = task_items
      @task_items = get_task_items(@@file_name) if @task_items == nil
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
      file = File.new(@@file_name, "w")
      @task_items.each { |task|
        file.puts(task.to_string)
      }
      file.close
    end

    private
    def get_task_items(file_name)
      task_list = []

      if (File.exist?(file_name))
        IO.foreach(file_name){|line|
          splits = line.split(',')
          task_list << create_task(splits)
        }
      end

      task_list
    end

    private
    def create_task(splits)
      task = Task.create(splits[0].chomp, splits[1].chomp, splits[2].chomp, splits[3].chomp)
      task.settaskediteddate(splits[4].chomp) if splits[4] != nil && splits[4] != ''
      task.settaskcompleteddate(splits[5].chomp) if splits[5] != nil && splits[5] != ''

      task
    end
end

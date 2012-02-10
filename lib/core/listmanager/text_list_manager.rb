require_relative './base_list_manager.rb'

class TextListManager < BaseListManager
    def write_changes
      file = File.new(@@file_name, "w")
      @task_items.each { |task|
        file.puts(task.to_string)
      }
      file.close
    end

    def get_task_items
      task_list = []

      if (File.exist?(@@file_name))
        IO.foreach(@@file_name){|line|
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

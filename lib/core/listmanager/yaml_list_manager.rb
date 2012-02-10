require 'yaml'
require_relative './base_list_manager.rb'

class YamlListManager < BaseListManager
  def write_changes
    f = File.new(@@file_name_yml, 'w')
    YAML.dump(@task_items, f)
  end

  def get_task_items
    task_list = []

    File.open(@@file_name_yml) { |data|
        task_list = YAML.load(data)
      } if (File.exists?(@@file_name_yml))

    task_list = [] if (task_list != nil && !task_list.kind_of?(Array))

    task_list
  end
end

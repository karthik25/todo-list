class HelpTask < TaskBase
  def display_help(cmd_str)
    help = get_help_hash

    t_captures = Stringsplitter.split_string(cmd_str)
    t = t_captures.first

    help_str = help[t]

    puts(help_str) if help_str != nil
  end

  def has_valid_params
    @props == nil
  end

  def execute
    help = get_help_hash
    puts("\n")
    help.each { |key,value|
      printf("%-20s %s\n",key,value)
    }
  end

  private
  def get_help_hash
    help = Hash.new
    help["list"] = "list all | [category_name]"
    help["add"] = 'add "task_name" ["category_name"]'
    help["mark"] = "mark task_id"
    help["unmark"] = "unmark task_id"
    help["delete"] = "delete task_id"

    help
  end
end

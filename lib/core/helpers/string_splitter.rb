require 'shellwords'

class Stringsplitter
  def Stringsplitter.split_string(str)
    split_str = []

    begin
      split_str = Shellwords::shellwords(str)
    rescue

    end
    
    split_str
  end
end
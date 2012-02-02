class Task
    def initialize(id, name, category, date)
      @task_id = id
      @task_name = name
      @task_category = category
      @task_added_date = date
      @task_edited_date = nil
      @task_completed_date = nil
    end

    def gettaskid
      @task_id
    end

    def gettaskname
      @task_name
    end

    def gettaskcategory
      @task_category
    end

    def gettaskaddeddate
      @task_added_date
    end

    def settaskediteddate(date)
      @task_edited_date = date
    end

    def gettaskediteddate
      @task_edited_date
    end

    def settaskcompleteddate(date)
      @task_completed_date = date
    end

    def gettaskcompleteddate
      @task_completed_date
    end

    def to_string
      edited_date = ''
      edited_date = gettaskediteddate if gettaskediteddate != nil
      completed_date = ''
      completed_date = gettaskcompleteddate if gettaskcompleteddate != nil
      str = gettaskid.to_s + ',' + gettaskname + ',' + gettaskcategory + ',' + gettaskaddeddate + ',' + edited_date + ',' + completed_date
      str
    end

    def Task.create(id, name, category, date)
      Task.new(id, name, category, date)
    end
end

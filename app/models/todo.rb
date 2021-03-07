class Todo < ActiveRecord::Base
    validates :todo_text, presence: true
    validates :due_date, presence: true
    validates :todo_text, length: { minimum: 2 }

    belongs_to :user

    def self.of_user(user)
        all.where(user_id: user.id)
    end

    def due_today?
        due_date == Date.today
    end

    def self.overdue
        all.where("due_date < ?",Date.today)
    end

    def self.duetoday
        all.where(due_date: Date.today)
    end

    def self.duelater
        all.where("due_date > ?",Date.today)
    end

    def self.completed
        all.where(completed: true)
    end
    
    def to_displayable_string
        display_status = completed ? "[X]" : "[ ]"
        display_date = due_today? ? nil : due_date
        "#{id}. #{display_status} #{todo_text} #{display_date}"
    end

end
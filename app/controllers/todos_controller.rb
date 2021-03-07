class TodosController < ApplicationController
    def index
        @todos = Todo.of_user(current_user)
        render "index"
    end

    def create
        todo_text = params[:todo_text_input]
        due_date = params[:due_date_input]
        new_todo = Todo.new(
            todo_text: todo_text, 
            due_date: due_date, 
            completed: false,
            user_id: current_user.id
        )
        if new_todo.save
            redirect_to todos_url
        else
            flash[:error] = new_todo.errors.full_messages.join(", ")
            redirect_to todos_url
        end
    end

    def update
        id = params[:id]
        completed = params[:completed]
        todo = Todo.of_user(current_user).find(id)
        todo.completed = completed
        todo.save!
        redirect_to todos_url
    end

    def destroy
        id = params[:id]
        todo = Todo.of_user(current_user).find(id)
        todo.delete
        redirect_to todos_url
    end
end

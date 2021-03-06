class TodosController < ApplicationController
    def index
        #render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
        render "index"
    end

    def create
        todo_text = params[:todo_text_input]
        due_date = DateTime.parse(params[:due_date_input])
        Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
        #render plain: todo.to_pleasant_string + " has been created"
        redirect_to todos_url
    end

    def update
        id = params[:id]
        completed = params[:completed]
        todo = Todo.find(id)
        todo.completed = completed
        todo.save!
        redirect_to todos_url
    end

    def destroy
        id = params[:id]
        todo = Todo.find(id)
        todo.delete
        redirect_to todos_url
    end
end

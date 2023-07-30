# frozen_string_literal: true

class TodoReflex < ApplicationReflex
  def submit
    todo = element.dataset.todo_id.nil? ? Todo.new : Todo.find(element.dataset.todo_id)
    todo.assign_attributes(todo_params)
    if todo.save
      morph '#new_todo', render(partial: 'todos/form', locals: { todo: Todo.new })
      morph '#todos', render(Todo.order(created_at: :desc))
    else
      morph '#new_todo', render(partial: 'todos/form', locals: { todo: todo })
    end
  end

  def edit
    puts 'editando'
    todo = Todo.find(element.dataset.todo_id)
    morph "#todo_#{todo.id}", render(partial: 'todos/form', locals: { todo: todo })
  end

  def destroy(id)
    puts 'removendo'
    todo = Todo.find(id)
    todo.destroy
    morph "#todo_#{id}", nil
    puts '------------------------'
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :done)
  end
end

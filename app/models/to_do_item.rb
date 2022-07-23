# frozen_string_literal: true

class ToDoItem < ApplicationRecord
  belongs_to :list, class_name: 'ToDoList'
  has_many :tasks, class_name: 'ToDoSubTask'
end

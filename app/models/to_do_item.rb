# frozen_string_literal: true

class ToDoItem < ApplicationRecord
  belongs_to :list, class: 'ToDoList'
  has_many :tasks, class: 'ToDoSubTask'
end

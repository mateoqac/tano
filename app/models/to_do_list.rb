# frozen_string_literal: true

class ToDoList < ApplicationRecord
  has_many :items, class: 'ToDoItem'
end

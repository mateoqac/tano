# frozen_string_literal: true

class ToDoSubTask < ApplicationRecord
  belongs_to :item, class_name: 'ToDoItem'
end

# frozen_string_literal: true

class ToDoSubTask < ApplicationRecord
  belongs_to :item, class: 'ToDoItem'
end

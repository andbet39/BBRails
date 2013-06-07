class Expense < ActiveRecord::Base
  belongs_to :reservation
  attr_accessible :date, :title, :value
end

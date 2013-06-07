class Customer < ActiveRecord::Base
  attr_accessible :email, :last_name, :name
end

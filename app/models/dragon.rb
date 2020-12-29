class Dragon < ActiveRecord::Base

  validates_presence_of :name, :color, :breed, :personality, :treasure
end

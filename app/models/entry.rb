class Entry < ActiveRecord::Base
  attr_accessible :message
  validates_presence_of :message
end

class Choice
  include Mongoid::Document

  field :question
  field :correct, :type => Boolean, :default => false

  validates_presence_of :question
  
  embedded_in :answerable, :polymorphic => true
end

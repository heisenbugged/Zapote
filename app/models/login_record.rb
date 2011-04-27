class LoginRecord
  include Mongoid::Document
  referenced_in :user

  field :date, :type => Time
end

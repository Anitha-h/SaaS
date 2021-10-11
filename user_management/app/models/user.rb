class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{username}  #{email}"
  end
end

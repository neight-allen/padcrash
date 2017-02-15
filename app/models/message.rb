class Message < ApplicationRecord
  validates_presence_of :content
  belongs_to :reservation
  belongs_to :author, class_name: "User", foreign_key: :user_id

  def author_name
    "#{author.first_name.capitalize} #{author.last_name.first.capitalize}."
  end
end

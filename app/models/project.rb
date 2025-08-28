class Project < ApplicationRecord
  validates :name, presence: { message: "Please add a name..." }
end

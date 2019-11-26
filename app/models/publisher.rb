class Publisher < ApplicationRecord
  def self.available
    where(online: true)
  end

  has_many :books
end

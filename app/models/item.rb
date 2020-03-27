class Item < ApplicationRecord
    belongs_to :storage
    validates :name, presence: true

end

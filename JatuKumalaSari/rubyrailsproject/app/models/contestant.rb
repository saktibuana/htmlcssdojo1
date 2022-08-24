class Contestant < ApplicationRecord
    validates :name, {presence: true}
    validates :age, {presence: true}
end

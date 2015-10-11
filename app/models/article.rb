class Article < ActiveRecord::Base
    validates :phone_number, presence: true, numericality: { only_integer: true }, length: { is: 10 }
end

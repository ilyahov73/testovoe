class User < ApplicationRecord
    enum gender: {male: 0, female: 1}

    has_and_belongs_to_many :skills
    has_and_belongs_to_many :interests
end

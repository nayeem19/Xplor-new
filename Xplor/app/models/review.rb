class Review < ActiveRecord::Base
    belongs_to :apt
    belongs_to :user
end

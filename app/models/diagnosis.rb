class Diagnosis < ApplicationRecord
    has_and_belongs_to_many :patients

end

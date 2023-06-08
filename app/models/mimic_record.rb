class MimicRecord < ApplicationRecord
    self.abstract_class = true
   # connects_to database: { reading: :mimic3 }
    establish_connection :mimic3
end 
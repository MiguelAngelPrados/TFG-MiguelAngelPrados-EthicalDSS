class Patient < ApplicationRecord
    has_and_belongs_to_many :diagnoses
    has_many :interventions
    has_many :medical_teams, through: :interventions

    validates :name, presence: true
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :gender, presence: true, inclusion: { in: %w(Male Female Other) }
    validates :admission_reason, presence: true
end

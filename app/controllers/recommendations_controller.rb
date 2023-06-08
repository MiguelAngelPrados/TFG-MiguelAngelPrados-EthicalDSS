class RecommendationsController < ApplicationController
  
  before_action :authenticate
  before_action :load_patient, except: [:index]

  def index
    @patients = Patient.all
  end

  def new
    @intervention_ids = []
  end

  def result
    @global = params.permit(:patient_competence, :family_competence, :medical_team,
    :diagnosis, :intervention, :beneficence, :non_maleficence, :autonomy, :justice).values.map(&:to_i).map { |a| a * 0.1 }

    @total = 0

    @profile = []
    @scores = []

    @patient_judgement_total = 0
    @family_criteria_total = 0
    @medical_team_quality_total = 0
    @diagnostic_reliability_total = 0
    @intervention_success_rate_total = 0
    @beneficence_total = 0
    @non_maleficence_total = 0
    @autonomy_total = 0
    @justice_total = 0

    @highest_score = 0
    @solution = nil

    @patient.interventions.each do |intervention|

      instance_variable_set("@intervention_values_#{intervention.id}", params.permit(:"patient_judgement_#{intervention.id}", :"family_criteria_#{intervention.id}",
      :"medical_team_quality_#{intervention.id}", :"diagnostic_reliability_#{intervention.id}", :"intervention_success_rate_#{intervention.id}",
      :"beneficence_#{intervention.id}", :"non_maleficence_#{intervention.id}", :"autonomy_#{intervention.id}", :"justice_#{intervention.id}").values.map(&:to_i))

      instance_variable_set("@intervention_values_#{intervention.id}", instance_variable_get("@intervention_values_#{intervention.id}").zip(@global).map { |a, b| a * b } )

      @total += instance_variable_get("@intervention_values_#{intervention.id}").sum
      @patient_judgement_total += instance_variable_get("@intervention_values_#{intervention.id}")[0]
      @family_criteria_total += instance_variable_get("@intervention_values_#{intervention.id}")[1]
      @medical_team_quality_total += instance_variable_get("@intervention_values_#{intervention.id}")[2]
      @diagnostic_reliability_total += instance_variable_get("@intervention_values_#{intervention.id}")[3]
      @intervention_success_rate_total += instance_variable_get("@intervention_values_#{intervention.id}")[4]
      @beneficence_total += instance_variable_get("@intervention_values_#{intervention.id}")[5]
      @non_maleficence_total += instance_variable_get("@intervention_values_#{intervention.id}")[6]
      @autonomy_total += instance_variable_get("@intervention_values_#{intervention.id}")[7]
      @justice_total += instance_variable_get("@intervention_values_#{intervention.id}")[8]
    end

    @profile << (@patient_judgement_total / @total)
    @profile << (@family_criteria_total / @total)
    @profile << (@medical_team_quality_total / @total)
    @profile << (@diagnostic_reliability_total / @total)
    @profile << (@intervention_success_rate_total / @total)
    @profile << (@beneficence_total / @total)
    @profile << (@non_maleficence_total / @total)
    @profile << (@autonomy_total / @total)
    @profile << (@justice_total / @total)

    @patient.interventions.each do |intervention|

      score = instance_variable_get("@intervention_values_#{intervention.id}").zip(@profile).map { |a, b| a * b }.sum

      @scores << score

      if ( score > @highest_score )
        @highest_score = score
        @solution = intervention
      end

    end

  end

  private

  def load_patient
    @patient = Patient.find params[:patient_id]
  end

end

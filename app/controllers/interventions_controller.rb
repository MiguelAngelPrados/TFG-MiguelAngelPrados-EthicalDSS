class InterventionsController < ApplicationController

  before_action :authenticate
  before_action :admin_permissions, except: [:index]
  before_action :load_intervention, except: [:new, :index, :create]

  def index
    @interventions = Intervention.all
  end

  def new
    @intervention = Intervention.new 
  end

  def create
    patient = Patient.find_by name: intervention_params[:name]
    medical_team = MedicalTeam.find_by specialization: intervention_params[:medical_team]
    @intervention = Intervention.new
    @intervention.patient = patient
    @intervention.medical_team = medical_team
    @intervention.procedure = intervention_params[:procedure]
    @intervention.patient_judgement = intervention_params[:patient_judgement]
    @intervention.family_criteria = intervention_params[:family_criteria]
    if @intervention.save
      redirect_to interventions_path, notice: "Intervention created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    patient = Patient.find_by name: intervention_params[:name]
    medical_team = MedicalTeam.find_by specialization: intervention_params[:medical_team]
    if @intervention.update(patient_id: patient.id, medical_team_id: medical_team.id, procedure: intervention_params[:procedure], patient_judgement: intervention_params[:patient_judgement], family_criteria: intervention_params[:family_criteria])
      redirect_to interventions_path, notice: "Intervention updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @intervention.destroy
    redirect_to interventions_path, alert: "Intervention deleted successfully."
  end

  private 

  def load_intervention
    @intervention = Intervention.find params[:id]
  end

  def intervention_params
    params.require(:intervention).permit(:name, :medical_team, :procedure, :patient_judgement, :family_criteria)
  end

end


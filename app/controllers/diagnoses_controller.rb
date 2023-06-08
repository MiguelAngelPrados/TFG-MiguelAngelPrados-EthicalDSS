class DiagnosesController < ApplicationController
  
  before_action :authenticate
  before_action :admin_permissions, except: [:index]
  before_action :load_patient

  def index
    
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.find_by description: params.require(:diagnosis).permit(:description)[:description]

    if @patient.diagnoses.include?(@diagnosis)
      redirect_to patient_diagnoses_path(@patient), alert: "Diagnosis already added"
    else
      @patient.diagnoses << @diagnosis
      redirect_to patient_diagnoses_path(@patient), notice: "Diagnosis added" 
    end

  end

  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.destroy
    redirect_to patient_diagnoses_path(@patient), alert: "Diagnosis deleted"
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:description)
  end

  def load_patient
    @patient = Patient.find params[:patient_id]
  end
end

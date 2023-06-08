class PatientsController < ApplicationController

  before_action :authenticate, except: [:index]
  before_action :admin_permissions, except: [:index, :show]
  before_action :load_patient, except: [:new, :index, :create]

  def index
    @patients = Patient.all 
  end

  def new
    @patient = Patient.new 
  end

  def create
    @patient = Patient.new patient_params
    if @patient.save
      redirect_to patients_path, notice: "Patient created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @patient.update patient_params
      redirect_to @patient, notice: "Patient updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.medical_teams.clear
    @patient.destroy
    redirect_to patients_path, alert: "Patient deleted successfully."
  end

  private

  def load_patient
    @patient = Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender, :admission_reason)
  end

end

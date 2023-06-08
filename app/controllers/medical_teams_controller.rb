class MedicalTeamsController < ApplicationController

  before_action :authenticate
  before_action :admin_permissions, except: [:index]
  before_action :load_medical_team, except: [:new, :index, :create]

  def index
    @medical_teams = MedicalTeam.all
  end

  def new
    @medical_team = MedicalTeam.new
  end

  def create
    @medical_team = MedicalTeam.new medical_team_params
    if @medical_team.save
      redirect_to medical_teams_path, notice: "Medical team created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @medical_team.update medical_team_params
      redirect_to medical_teams_path, notice: "Medical team updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @medical_team.patients.clear
    @medical_team.destroy
    redirect_to medical_teams_path, alert: "Medical team deleted successfully."
  end


  private

  def load_medical_team
    @medical_team = MedicalTeam.find params[:id]
  end

  def medical_team_params
    params.require(:medical_team).permit(:specialization)
  end

end

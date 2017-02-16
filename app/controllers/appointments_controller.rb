class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    @appointments = Appointment.all
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = appointment.new(article_params)
    if @appointment.save
      redirect_to appointments_path(@appointment)
    else
       render :new
    end
  end

  
  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    puts "----------"
    @user = User.find(session[:user_id])
    p @user
    puts "88*******"
    @appointment.update_attributes(student: @user)
    # @appointment.update_attributes(appointment_params)
    redirect_to appointment_path(@appointment)
  end

    
  private

  def appointment_params
    params.require(:appointment).permit(:student)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
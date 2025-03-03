class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:approve, :reject]

  def index
    @reservations = current_user.library_personnel? ? Reservation.all.where(status: 'pending') : current_user.reservations

    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @reservations }
      format.xml  { render xml: @reservations }
    end
  end

  def approve
    @reservation.update(status: 'approved')
    Loan.create(user: @reservation.user, book: @reservation.book, journal: @reservation.journal, due_date: 2.weeks.from_now)

    respond_to do |format|
      format.html { redirect_to reservations_path, notice: 'Reservation approved' }
      format.json { render json: @reservation, status: :ok }
      format.xml  { render xml: @reservation, status: :ok }
    end
  end 

  def reject
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_path, notice: 'Reservation rejected' }
      format.json { render json: @reservation, status: :ok }
      format.xml  { render xml: @reservation, status: :ok }
    end
  end
  
  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end

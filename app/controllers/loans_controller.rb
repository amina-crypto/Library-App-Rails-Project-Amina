class LoansController < ApplicationController
  before_action :authenticate_user!

  def index
    @loans = current_user.library_personnel? ? Loan.all : current_user.loans

    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @loans }
      format.xml  { render xml: @loans }
    end
  end

  def return
    @loan = Loan.find(params[:id])
    @loan.update(returned: true)
    @loan.book.reservation.destroy if @loan.book&.reservation
    @loan.journal.reservation.destroy if @loan.journal&.reservation

    respond_to do |format|  
      format.html { redirect_to loans_path, notice: 'Loan returned' }
      format.json { render json: @loan, status: :ok }
      format.xml  { render xml: @loan, status: :ok }
    end
  end
end

class JournalsController < ApplicationController
  before_action :authenticate_user!, only: [:reserve]
  before_action :set_journal, only: [:show, :reserve]
  def index
    @journals = Journal.all
    @journals = @journals.search(params[:search]) if params[:search].present?
    @journals = @journals.by_category(params[:category]) if params[:category].present?
    @current_category = params[:category]
    @query = params[:search]

    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @journals }
      format.xml  { render xml: @journals }
    end
  end

  def show
    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @journal }
      format.xml  { render xml: @journal }
    end
  end

  def reserve
    @journal.reservation.destroy if @journal.reservation&.reservation_expired?
    if @journal.available? && current_user.reservations.create(journal: @journal, expires_at: 2.hours.from_now, status: 'pending')
      respond_to do |format|  
        format.html { redirect_to journals_path, notice: "Journal reserved successfully" }
        format.json { render json: @journal, status: :created }
        format.xml  { render xml: @journal, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to journals_path, alert: "Failed to reserve journal" }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
        format.xml  { render xml: @journal.errors, status: :unprocessable_entity }  
      end
    end
  end

  private

  def set_journal
    @journal = Journal.find(params[:id])
  end
end

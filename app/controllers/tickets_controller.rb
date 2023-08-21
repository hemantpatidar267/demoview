class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    number_of_tickets = params[:ticket][:number_of_tickets].to_i
    theatre = Theatre.find(params[:ticket][:theatre_id])
    movie = Movie.find(params[:ticket][:movie_id])
    screen = Screen.find_by(theatre_id: params[:ticket][:theatre_id], movie_id: params[:ticket][:movie_id])
    @ticket = []
    if screen.seating_capacity < number_of_tickets
      flash.now[:notice] = "screen do not have space for ticket."
      redirect_to new_ticket_path
    else
      ticket_details = @current_user.tickets.new(ticket_params)
      if ticket_details.save
        @ticket << ticket_details
        screen.update(seating_capacity: screen.seating_capacity - number_of_tickets)
       redirect_to ticket_path(@ticket)
      else
        render :new
      end
    end
  end

  def

  def show
     @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = @current_user.tickets
  end

  private

  def ticket_params
    params.require(:ticket).permit(:movie_id, :theatre_id, :number_of_tickets, :user_id)
  end
end

class TicketsController < ApplicationController

  def index
    @tickets = @current_user.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    number_of_tickets = params[:ticket][:number_of_tickets].to_i
    theatre = Theatre.find(params[:ticket][:theatre_id])
    movie = Movie.find(params[:ticket][:movie_id])
    screen = Screen.where(theatre_id: params[:ticket][:theatre_id], movie_id: params[:ticket][:movie_id])
    @ticket = @current_user.tickets.new(ticket_params)
    if !screen.empty?
      for i in 0...screen.length do
        if screen[i].seating_capacity >= number_of_tickets
          x = i
          y = false
          break
        end
        y = true
      end
      if y
        flash[:notice] = 'Do not have enough seats'
        redirect_to   new_ticket_path
      elsif @ticket.save
        screen[x].update(seating_capacity: screen[x].seating_capacity - number_of_tickets)
        redirect_to @ticket
      else
        render :new , status: :unprocessable_entity
      end
    else
      flash[:notice] = 'asdfasdf'
      redirect_to   new_ticket_path
    end

  end

  private

  def ticket_params
    params.require(:ticket).permit(:movie_id, :theatre_id, :number_of_tickets, :user_id)
  end
end

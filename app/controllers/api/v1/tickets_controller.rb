class Api::V1::TicketsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    json_data = JSON.parse(request.body.read)
    ticket_data,excavator_data = Ticket.ticket_data(json_data)
    @ticket = Ticket.new(ticket_data)
    @excavator = @ticket.build_excavator(excavator_data)
    if @ticket.save
      @ticket.excavator = @excavator
      @excavator.ticket = @ticket
      if @excavator.save
        render json: { message: "Ticket and Excavator created successfully" }, status: :created
      else
        render json: { errors: @excavator.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

end

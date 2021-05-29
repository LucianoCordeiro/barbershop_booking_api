class BookingController < AuthorizationController
  before_action :logged_in?, except: :booking_times

  def booking_times
    @booking_times = BookingTime.all.order(:id).map do |booking_time|
      {
        id: booking_time.id,
        day: booking_time.formatted_day,
        hour: booking_time.formatted_hour,
        booked: booking_time.booked?
      }
    end

    render json: {booking_times: @booking_times}
  end

  def book
    @booking_time = BookingTime.find_by(id: params[:booking_time_id])

    return render json: {error: "Horário nao encontrado"} if @booking_time.blank?
    return render json: {error: "Esse horário já se encontra ocupado"} if @booking_time.booked?
    return render json: {error: "Você já possui horário marcado"} if current_user.has_booked_time?

    if @booking_time.update(user: current_user)
      render json: {
        success: true,
        booking_time: @booking_time
      }
    else
      render json: {error: "Ocorreu algum erro"}
    end
  end

  def cancel
    @booking_time = current_user.booking_time

    return render json: {error: "Você nao possui nenhum horário para desmarcar"} if @booking_time.blank?

    if @booking_time.update(user: nil)
      render json: {
        success: true,
        booking_time: @booking_time
      }
    else
      render json: {error: "Ocorreu algum erro"}
    end
  end

  def current_booked_time
    render json: {current_booked_time: current_user.booking_time}
  end
end

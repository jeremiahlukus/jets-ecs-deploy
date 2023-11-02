class HealthCheckController < ApplicationController

  def show
    render json: {}, status: :ok
  end
end

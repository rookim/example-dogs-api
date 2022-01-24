class DogsController < ApplicationController
  def create
    dog = Dog.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: current_user
    )
    if dog.save
      render json: dog.as_json
    else
      render json: {errors: dog.errors.full_messages}, status: :unprocessable_entity
    end
  end
end

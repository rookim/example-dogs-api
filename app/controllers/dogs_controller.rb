class DogsController < ApplicationController
  
  def create
    # if user is logged in they can go on.....
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: current_user.id
      )
      if dog.save
        render json: dog.as_json
      else
        render json: {errors: dog.errors.full_messages}, status: :unprocessable_entity
      end
    else
      # 3 render statements ok??????????
      render json: {Error: "Please log in first."}
    end
  end

end

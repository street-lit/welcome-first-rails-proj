class UsersController < ApplicationController

  def index
    users = User.all

    if users.nil?
      render({ text: "That user isn't found", status: 404 })
    elsif params.size ==  2
      users_list = []
      users_list = users.map do |user|
        "#{user.full_name}, #{user.age} <br>"
      end
    users_formatted = users_list.join(" ")
      render({text: "Hello, this is all the users: <br><br> #{users_formatted} <br> Params: #{params.inspect} ", status: 200})
    elsif params.size > 2 && params.has_key?(:first_name)
      users_list = User.where("first_name LIKE ?", "#{params[:first_name]}%")
      users_list = users_list.map { |user| "#{user.full_name}, #{user.age}" }
      users_formatted = users_list.join(" ")
      render({text: "params.inspect: #{params.inspect} <br> params.size: #{params.size} <br> Hello, your search returned: #{users_formatted} for users who's #{params.keys[0]} starts with #{params[:first_name]} ", status: 200})
    elsif params.size > 2 && params.has_key?(:limit) && params.has_key?(:offset)
      users_list = User.limit(params[:limit]).offset(params[:offset])
      users_list = users_list.map { |user| "id-#{user.id}:  #{user.full_name}, #{user.age} <br>" }
      users_formatted = users_list.join(" ")
      render({text: "params.inspect: #{params.inspect} <br> params.size: #{params.size} <br> Hello, your search for a limit of 10 people, offset by 10 returned the following: <br><br> #{users_formatted}", status: 200})
    end
  end

  def show
    user = User.find(params[:id])
    render text: "user: #{user.full_name}, Age: #{user.age}"
  rescue ActiveRecord::RecordNotFound
    render text: "params.inspect: #{params.inspect} <br> params.size: #{params.size} <br> Sorry, user with id of #{params[:id]} was not found", status: 404
  end

  def create
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.age = params[:age]
    if user.save
      render text: "params.inspect: #{params.inspect} <br> params.size: #{params.size} <br>  Hello, you created the user: #{params[:first_name]} #{params[:last_name]} with age #{params[:age]} and id #{user.id}", status: 200
    end
  end

  def destroy
    user_info = User.find(params[:id])
    if params[:action] == "destroy"
      user = User.find(params[:id])
      user.destroy
      render({text: "Hello, the the user you're looking for: #{user_info.first_name} #{user_info.last_name}, Age: #{user_info.age} - has been destroyed.", status: 200})
    end
    rescue ActiveRecord::RecordNotFound
      render({ text: "Sorry, user with id of #{params[:id]} was not found", status: 404 })
  end
end

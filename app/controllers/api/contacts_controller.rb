class Api::ContactsController < ApplicationController

  def first_contact_action
    @contact = Contact.first

    render "first_contact.json.jb"
  end
  def all_contacts_action
    @contacts = Contact.all
    render "all_contacts.json.jb"
  end

  def index
    @contacts = current_user.contacts           #array of contact hashes

    if params[:search]
      @contacts = Contact.where("first_name iLIKE ? or last_name iLIKE ? or email iLIKE ?", "#{params[:search]}", "#{params[:search]}", "#{params[:search]}")
    end

    @contacts = @contacts.order(:id)

    render "index.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params["id"])           
    render "show.json.jb"
  end

  def create

    coordinates = Geocoder.address(params[:address])

    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      longitude: params[:longitude],
      latitude: params[:latitude],
      email: params[:email],
      bio: params[:bio],
      user_id: current_user.id
      )
    if @contact.save
      render "show.json.jb"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    if params[:address]
      coordinates = Geocoder.coordinates(params[:address])
      @contact.longitude = coordinates[1] || @contact.longitude
      @contact.latitude = coordinates[0] || @contact.latitude
    end

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render "show.json.jb"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def destroy
    contact = Contact.find_by(id: params["id"])
    contact.destroy
    render json: {message: "Contact successfully removed"}
  end
end

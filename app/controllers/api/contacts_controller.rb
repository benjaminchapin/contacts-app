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
    @contacts = Contact.all
    render "contacts.json.jb"
  end

  def new
    @contacts = Contact.new
    render "contacts.json.jb"
  end

  def show
    @contacts = Contact.find_by(id: params["id"])
    render "contacts.json.jb"
  end

  def create
    @contacts = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email]
      )
    @contacts.save
    render "contacts.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.first_name = params[:first_name] || @contact.first_name,
    @contact.last_name = params[:last_name] || @contact.last_name,
    @contact.email = params[:email] || @contact.email,
    @contact.phone_number = params[:phone_number] || @contact.phone_number

    @contact.save
    render "contacts.json.jb"
  end

  def destroy
    contact = Contact.find_by(id: params["id"])
    contact.destroy
    render json: {message: "Contact successfully removed"}
  end
end

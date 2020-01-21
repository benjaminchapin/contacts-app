Rails.application.routes.draw do
  namespace :api do
    # get "/first_contact_url" => "contacts#first_contact_action"
    # get "/all_contacts_url" => "contacts#all_contacts_action"

  get "/contacts" => "contacts#index"
  get "/contacts" => "contacts#new"
  get "/contacts/:id" => "contacts#show"
  post "/contacts" => "contacts#create"
  patch "/contacts/:id" => "contacts#update"
  delete "contacts/:id" => "contacts#destroy"
  end
end

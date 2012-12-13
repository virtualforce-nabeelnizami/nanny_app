NannyApp::Application.routes.draw do
  root :to => 'home#index'
  
  get "home/index"
  get "home/contact"
  get "home/info"
  get "home/about"

  get "home/switch_location"

  # get "captcha", :to => "home#captcha"

  # resources :products
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks" }

  resources :users,:except => [:show]
  resources :references
  resources :users do
    resources :user_roles
  end

  resource :profile do
    get :upload_photo
    put :save_photo
    #get :crop
  end
  
  match 'dashboard' => 'home#general', :as => 'user_root'
  match 'general' => 'home#general', :as => 'user_root'

  resources :education_and_interests do
    collection do
      get 'language_lists', :to => "education_and_interests#language_lists"
    end
  end


  get   "/contact", :to => "home#contact"
  post  "/contact", :to => "home#send_email"

end
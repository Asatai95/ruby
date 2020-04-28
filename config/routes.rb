Rails.application.routes.draw do

  # デバイスのルーティング
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }

  # devise_scope :user do
  #   match '/sign-in' => "devise/sessions#new", :as => :login
  # end

  # devise_for :users, :skip => [:registrations]#デフォルトルートを切る
  # as :user do
  # authenticated :user do # 認証をかける
  # devise_scope :user do
  #   get 'users/sign_up' => 'devise/registrations#new', :as => :new_user_registration
  #   post 'users/sign_up' => 'devise/registrations#create', :as => :user_registration
  # end
  
  
  # devise_for :users => [:registrations]#デフォルトルートを切る
  # as :user do
  # authenticated :user do # 認証をかける
  #   get 'users/sign_up' => 'devise/registrations#new', :as => :new_user_registration
  #   post 'users/sign_up' => 'device/registrations#create', :as => :user_registration
  # end
  #   end





  resources :articles
  root "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

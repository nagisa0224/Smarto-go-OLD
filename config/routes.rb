Rails.application.routes.draw do
  
  #devise_for :shops
  devise_for :admins, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  
  namespace :admin do
    get "top" => "homes#top"
    
    resources :shop, except: [:new, :create, :destroy]
    
  end
  
  
  #devise問題　shopに変更
  devise_for :shops, controllers: {
    registrations: "shop/registrations",
    sessions: "shop/sessions"
  }

  
  
  scope module: :shop do
    root "homes#top"
    get "/about" => "homes#about"
    get "/shops/my_page" => "shops#show"
    get "shops/information/edit" => "shops#edit"
    patch "shops/information" => "shops#update"
    get "shops/confirm_withdraw" => "shops#confirm_withdraw"
    patch "shops/withdraw" => "shops#withdraw"
    
    resources :items
    
    resources :reservation_details, only: [:create, :update, :destroy]
    
    #notification
    
    resources :to_gos

  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

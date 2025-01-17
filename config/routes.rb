Rails.application.routes.draw do

  match '/downloads/:product_id' => 'downloads#index',:as => :downloads
  match '/downloads/:product_id/:id' => 'downloads#show', :as => :download_individual

  namespace :admin do
    resources :products do
      resources :s3_products
    end
  end
  
end

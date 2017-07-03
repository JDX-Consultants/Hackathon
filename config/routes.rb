Rails.application.routes.draw do
  resources :valid_plates
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :plate do
        get :validate
    end

    resources :pp do
        delete :delete_all, on: :collection
    end

    resources :pos do
        get :filter, on: :collection
        delete :delete_all, on: :collection
    end

    resource :map

    resource :command do
        get :get
        get :image
        post :view
        get :scan
    end
end

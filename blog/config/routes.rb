Rails.application.routes.draw do
	root 'welcome#index'

	resources :articles do
    resources :comments
  end

  get 'welcome/index'
end

EmberjsExample::Application.routes.draw do
  root to: 'pages#index'
  resources :posts, defaults: { format: :json }
end

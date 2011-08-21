UnifiedDB::Application.routes.draw do
  root :to => 'home#show'
  match '/api' => 'api#show'
end

Rails.application.routes.draw do
  post '/vote' => 'polls#vote', as: :vote
  root "polls#index"
end

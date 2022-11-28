Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  # route for our custom method, summary (created in movie_summary_serializer file )
  get '/movies/:id/summary', to: 'movies#summary'
  # route for movie collection
  get '/movie_summaries', to: 'movies#summaries'
end

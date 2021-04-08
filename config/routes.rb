Rails.application.routes.draw do
  get '/tiles/:zoom/:x/:y',  to: 'tiles#show'
  resource :tile_json, only: :show
  resource :tile_style, only: :show

  root to: "prefectures#index"
end

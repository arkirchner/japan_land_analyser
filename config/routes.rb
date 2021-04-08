Rails.application.routes.draw do
  get '/tiles/:zoom/:x/:y',  to: 'tiles#show'

  root to: "prefectures#index"
end

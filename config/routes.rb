Rails.application.routes.draw do
  get 'trending_videos/index'

  get 'divide_by_zero/index'

  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

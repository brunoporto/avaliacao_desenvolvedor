Rails.application.routes.draw do

  root 'imports#index'
  post '/imports/save', to: 'imports#save'

end
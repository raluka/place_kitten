Rails.application.routes.draw do
  
  get 'pic/:width/:height' => 'application#kitten'
  get 'blur/:width/:height' => 'application#bluring'
end

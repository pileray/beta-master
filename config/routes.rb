Rails.application.routes.draw do
  namespace :mypage do
    get 'accounts/edit'
  end
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  root "static_pages#top"
  get "/complete_signup", to: "static_pages#complete_signup"
  get "/terms", to: "static_pages#terms"
  get "/privacy", to: "static_pages#privacy"
  delete '/logout', to: 'sessions#destroy'

  resources :quizzes, only: [:index] do
    resource 'random_exam', on: :member, module: 'quizzes', only: %w[show]
    resource 'bookmarked_exam', on: :member, module: 'quizzes', only: %w[show]
    resource 'bookmark', on: :member, module: 'quizzes', only: %w[create destroy]
  end

  namespace 'quizzes' do
    delete 'random_exam', to: 'random_exams#destroy'
    delete 'bookmarked_exam', to: 'bookmarked_exams#destroy'
  end

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
  end

  namespace 'mypage' do
    root to: 'quizzes#index'
    resources :quizzes, only: %w[index]
    resource :line_notification, only: %w[edit update]
    resource :account, only: %w[edit]
  end

  resources :users, only: %w[destroy]
end

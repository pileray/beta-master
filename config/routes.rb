Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  root "static_pages#top"
  get "/complete_signup", to: "static_pages#complete_signup"
  delete '/logout', to: 'sessions#destroy'

  resources :quizzes, only: [:index] do
    # 今後クイズ出題機能で実装
    resource 'random_exam', on: :member, module: 'quizzes', only: %w[show]
    resource 'bookmarked_exam', on: :member, module: 'quizzes', only: %w[show]
  end

  # 今後クイズ出題機能で実装
  namespace 'quizzes' do
    delete 'random_exam', to: 'random_exams#destroy'
    delete 'bookmarked_exam', to: 'bookmarked_exams#destroy'
  end

end

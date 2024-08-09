class StaticPagesController < ApplicationController
  layout 'static_pages/layouts/application'

  def top
    @sample_quiz = Quiz.all.sample
  end

  def complete_signup; end

  def terms; end

  def privacy; end
end

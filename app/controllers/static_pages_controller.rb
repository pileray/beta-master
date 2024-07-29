class StaticPagesController < ApplicationController
  def top
    @sample_quiz = Quiz.all.sample
  end

  def complete_signup; end
end

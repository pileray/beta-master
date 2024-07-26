class QuizDecorator < Draper::Decorator
  delegate_all

  def truncated_body
    object.body[0, object.offset] + "/"
  end
end

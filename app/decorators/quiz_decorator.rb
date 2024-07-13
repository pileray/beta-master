class QuizDecorator < Draper::Decorator
  delegate_all
  def category_badge_class
    case self.category.name
    when 'エンタメ'
      'badge bg-sky-100 text-xs'
    when 'スポーツ'
      'badge bg-red-300 text-xs'
    when '生活'
      'badge bg-yellow-300 text-xs'
    when '社会'
      'badge bg-orange-300 text-xs'
    when '文学・歴史'
      'badge bg-blue-300 text-xs'
    when '自然科学'
      'badge bg-purple-300 text-xs'
    when '芸術・音楽'
      'badge bg-green-500 text-xs'
    else
      'badge badge-outline text-xs'
    end
  end

end

require_relative 'decorator'

class TrimDecorator < Decorator
  def correct_name
    trimmed = @nameable.correct_name
    trimmed.length > 10 ? trimmed[0..9] : trimmed
  end
end

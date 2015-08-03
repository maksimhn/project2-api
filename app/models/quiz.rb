class Quiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  def progress_stats
    word_count = Float(Word.all.length)
    quizzed_count = Float(Quiz.all.uniq { |noun| noun.word_id }.length)
    rate = quizzed_count / word_count
    rate.round(4) * 100
  end
end

class Quiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  attr_reader :success_rate

  def progress_stats
    word_count = Word.all.length
    quizzed_count = Quiz.all.uniq { |noun| noun.word_id }.length
    word_count / quizzed_count * 100
  end

  def success_rate_stats
    hits = Quiz.where(:result => true, :user_id => user.id).length
    quizzed_count = Quiz.where(:user_id => user.id).length
    hits / quizzed_count * 100
  end

  def reset_contents

  end

end

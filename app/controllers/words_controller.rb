class WordsController < ApplicationController

  def random_word
    random_noun = Word.get_random_word
    render json: { noun: random_noun.word, gen: random_noun.gender, pic: random_noun.pic }
  end

end

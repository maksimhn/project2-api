class WordsController < ApplicationController

  # sends back a random word from the pool
  def random_word
    random_noun = Word.get_random_word
    render json: { noun: random_noun.word, gen: random_noun.gender, pic: random_noun.pic, id: random_noun.id }
  end

  # updates a particular word's gender
  def update
    word = Word.find(params[:id])
    word.gender = params[:gender]
    if word.save
      head :ok
    end
  end

end

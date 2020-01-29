require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(text_from_user)
    @count_of_vowels = @analyzed_text.count_of_vowels.to_s
    @count_of_consonants = @analyzed_text.count_of_consonants.to_s
    @count_of_words= @analyzed_text.count_of_words.to_s
    @most_used_letter = @analyzed_text.most_used_letter.keys
    @letter_most = @most_used_letter[0].upcase
    @just_values = @analyzed_text.most_used_letter.values
    @times_used = @just_values[0].to_s
    
    erb :results
  end

end

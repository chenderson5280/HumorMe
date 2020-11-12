class User < ActiveRecord::Base
    has_many :favorites
    has_many :jokes, through: :favorites

    def find_favorite_ids
        joke_ids = self.favorites.map {|favorite| favorite.joke_id}
    end

    def find_favorite_jokes
        find_favorite_ids
            joke_ids.map do |id|
            Joke.find_by id: id
        end
    end

    def display_favorite_jokes
        puts find_favorite_jokes.map {|joke| TTY::Box.frame(width: 90, height: 11, border: :thick) {joke.content}}.uniq
    end

end
require 'pry'
require_relative '../config/environment'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

class Cli

    attr_accessor :user

    def initialize user=nil
        @user = user
    end

    def tty_prompt
        TTY::Prompt.new
    end

    def welcome_screen
    puts "        ██╗  ██╗██╗   ██╗███╗   ███╗ ██████╗ ██████╗     ███╗   ███╗███████╗██╗
        ██║  ██║██║   ██║████╗ ████║██╔═══██╗██╔══██╗    ████╗ ████║██╔════╝██║
        ███████║██║   ██║██╔████╔██║██║   ██║██████╔╝    ██╔████╔██║█████╗  ██║
        ██╔══██║██║   ██║██║╚██╔╝██║██║   ██║██╔══██╗    ██║╚██╔╝██║██╔══╝  ╚═╝
        ██║  ██║╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██║  ██║    ██║ ╚═╝ ██║███████╗██╗
        ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝╚══════╝╚═╝" 
    end

    def have_you_been_here 
        user_input = tty_prompt.yes? "Welcome to HumorMe! Been here before?"
            user_input ? sign_in : sign_up
    end

    def sign_up
        username = tty_prompt.ask "Enter your new username:"
        user_age = tty_prompt.ask "What is your age?"
        
        @user = User.create name: username, age: user_age
            welcome_user
    end

    def sign_in
        user_input = tty_prompt.ask "Please enter your username..."
        found_user = User.find_by(name: user_input)
        if found_user
            self.user = found_user
            puts "Welcome back #{user.name}"
        else
            puts "Username does not exist. Let's try this again..."
            have_you_been_here
        end
    end

    def welcome_user
        puts "====================="
        puts "Welcome #{user.name}!"
        puts "====================="
    end
    
    def select_joke_type
        tty_prompt = TTY::Prompt.new

        if user.age.to_i >= 18
            @choice = tty_prompt.select "Choose your joke type" do |menu|
                menu.choice :Naughty, "Naughty"
                menu.choice :Knock_Knock, "Knock_Knock"
                menu.choice :Dad, "Dad"
                menu.choice :Math, "Math"
            end
        else
            @choice = tty_prompt.select "Choose your joke type" do |menu|
                menu.choice :Knock_Knock, "Knock_Knock"
                menu.choice :Dad, "Dad"
                menu.choice :Math, "Math"
            end
        end
        display_joke
    end

    def all_jokes_of_selected_category
        Joke.where(category: @choice)
    end

    def extract_content
        all_jokes_of_selected_category.map {|joke| joke.content}
    end

    def pick_random_joke
        i = rand(0..extract_content.length - 1)
        @current_joke = extract_content[i]
        @current_joke
        
    end

    def display_joke
        case @choice
        when "Knock_Knock"
            puts TTY::Box.frame(width: 90, height: 12, border: :thick) {pick_random_joke}
        else
            puts TTY::Box.frame(width: 90, height: 8, border: :thick) {pick_random_joke}
        end
        add_to_favorites_option
        see_favorites_option
        more_jokes_option
    end

    def more_jokes_option
        want_more_jokes = tty_prompt.yes? "Would you like to see more jokes?"
        want_more_jokes ? select_joke_type : exit_app
    end

    def see_favorites_option
        answer = tty_prompt.yes? "Would you like to see your favorites?"
        answer ? user.display_favorite_jokes : nil
    end

    def add_to_favorites_option
        add_to_favorites = tty_prompt.yes? "Add this to favorites?"
        add_to_favorites ? create_favorite : nil
    end

    def create_favorite
        current_joke = Joke.find_by content: @current_joke
        Favorite.create user: self.user, joke: current_joke
    end

    def start_app
        welcome_screen
        have_you_been_here
        select_joke_type
    end

    def exit_app
        puts "Goodbye!"
        welcome_screen
    end

end
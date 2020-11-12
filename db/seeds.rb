require 'pry'

Favorite.destroy_all
User.destroy_all
Joke.destroy_all


Joke.create name: "Squirrel Nuts", content: "Why does the squirrel swim on his back?\n\nTo keep his nuts dry!", category: "Naughty"
Joke.create name: "Chickpea", content: "What's the difference between a chickpea and a garbanzo bean?\n\nI've never payed to have a garbanzo bean on my face!", category: "Naughty"
Joke.create name: "European", content: "If you’re American in the living room, what are you in the bathroom?\n\nEuropean.", category: "Naughty"
Joke.create name: "Needle", content: "Knock-Knock.\n\nWho's there?\n\nNeedle.\n\nNeedle who?\n\nNeedle little help getting in!", category: "Knock_Knock"
Joke.create name: "Candice", content: "Knock-Knock.\n\nWho's there?\n\nCandice.\n\nCandice who?\n\nCandice door open any further? Its freezing out here!", category: "Knock_Knock"
Joke.create name: "Pirates", content: "Why do pirates hate the alphabet?\n\nBecause they get lost at C!", category: "Dad"
Joke.create name: "Dad Jokes", content: "I like to tell dad jokes, and sometimes he laughs!", category: "Dad"
Joke.create name: "Octapus", content: "How do you make an octapus laugh?\n\nTen tickles!", category: "Dad"
Joke.create name: "Ranch Dressing", content: "If I wore a cowboy hat and cowboy boots...\n\nWould that be ranch dressing?", category: "Dad"
Joke.create name: "Sign Language", content: "What is the least spoken language in the world?\n\nSign language", category: "Dad"
Joke.create name: "Nude Beach", content: "How do you spot a blind man on a nude beach?\n\nIt's not hard...", category: "Naughty"
Joke.create name: "2 squared", content: "Why didn't 4 ask out 5?\n\nHe was 2 squared!", category: "Math"
Joke.create name: "Binary", content: "They say there are 10 types of people...\n\nThose that know binary, and those who don't", category: "Math"
Joke.create name: "Pliers", content: "What tool is best suited for math?\n\nMulti-pliers!", category: "Math"
Joke.create name: "Lunch", content: "Why did the two fours skip lunch?\n\nThey already 8!", category: "Math"
Joke.create name: "Neckromancer", content: "What do you call an evil wizard who gives good hickeys?\n\nA neckromancer", category: "Wizard"
Joke.create name: "Glass Objects", content: "As a wizard, I enjoy turning objects into glass.\n\nJust wanted to make that clear.", category: "Wizard"
Joke.create name: "Dog Wizard", content: "What is a dog wizard called?\n\nLabracadabrador.", category: "Wizard"
Joke.create name: "Drunk Wizard", content: "What do you call a drunk wizard?\n\nStumbledore.", category: "Wizard"
Joke.create name: "Crabs", content: "Why don’t crabs give to charity?\n\nBecause they’re shellfish", category: "Dad"
Joke.create name: "Diet Sodas", content: "I got hit in the head with a can of Diet Coke today. Don’t worry, I’m not hurt.\n\nIt was a soft drink.", category: "Dad"
Joke.create name: "Jacket", content: "How do you steal a coat?\n\nYou jacket.", category: "Dad"


# binding.pry
# 0
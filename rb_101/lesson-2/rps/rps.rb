require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

GOAL_WINS = 5
USER_WIN = 1
COMPUTER_WIN = -1

CHOICES = { 'r' => 'rock',
            'p' => 'paper',
            's' => 'scissors',
            'l' => 'lizard',
            'k' => 'spock' }

GAME_KEY = { 'rock' => { 'rock' => 0, 'paper' => -1, 'scissors' => 1,
                         'lizard' => 1, 'spock' => -1 },
             'paper' => { 'rock' => 1, 'paper' => 0, 'scissors' => -1,
                          'lizard' => -1, 'spock' => 1 },
             'scissors' => { 'rock' => -1, 'paper' => 1, 'scissors' => 0,
                             'lizard' => 1, 'spock' => -1 },
             'lizard' => { 'rock' => -1, 'paper' => 1, 'scissors' => -1,
                           'lizard' => 0, 'spock' => 1 },
             'spock' => { 'rock' => 1, 'paper' => -1, 'scissors' => 1,
                          'lizard' => -1, 'spock' => 0 } }

def display_player_choices(player_choice, comp_choice)
  sleep 0.5
  puts format(MESSAGES['you_chose'], p1: player_choice.capitalize)
  puts format(MESSAGES['comp_chose'], p2: comp_choice.capitalize)
end

def display_winner(player_choice, comp_choice)
  result = GAME_KEY[player_choice][comp_choice]

  if result == 1
    puts format(MESSAGES['you_won'], p1: player_choice.capitalize,
                                     p2: comp_choice.capitalize)
  elsif result == -1
    puts format(MESSAGES['comp_won'], p2: comp_choice.capitalize,
                                      p1: player_choice.capitalize)
  else
    puts format(MESSAGES['tie'], p1: player_choice.capitalize)
  end
end

def display_results(player_choice, comp_choice)
  display_player_choices(player_choice, comp_choice)
  display_winner(player_choice, comp_choice)
end

def display_score(score)
  sleep 1
  puts format(MESSAGES['display_score'], user_score: score[:user],
                                         comp_score: score[:comp])
end

def display_grand_winner(score)
  if score[:user] == GOAL_WINS
    puts MESSAGES['you_are_first']
    sleep 1
    puts MESSAGES['you_are_gw']
  elsif score[:comp] == GOAL_WINS
    puts MESSAGES['comp_was_first']
    sleep 1
    puts MESSAGES['comp_is_gw']
  else
    error "display_grand_winner: neither player has reached #{GOAL_WINS}"
  end
end

def display_move_choices
  prompt(MESSAGES['choose_one'])

  CHOICES.each do |abbrev, choice|
    puts "   " + abbrev + " => " + choice
  end
end

def valid_choice?(input)
  CHOICES.values.include?(input.downcase) ||
    CHOICES.keys.include?(input.downcase)
end

def get_choice
  display_move_choices

  choice = ''
  loop do
    print "=> "
    input = gets.chomp

    if valid_choice?(input)
      choice = CHOICES[input.downcase] || input.downcase
      break
    else
      prompt(format(MESSAGES['invalid_choice'], input: input))
    end
  end

  choice
end

def prompt(message)
  puts("=> #{message}")
end

def clear
  system('clear') || system('cls')
end

def get_yes_or_no
  loop do
    print "=> "
    answer = gets.chomp.downcase
    if answer == 'y' || answer == 'yes'
      return true
    elsif answer == 'n' || answer == 'no'
      return false
    end
    prompt MESSAGES['invalid_yes_no']
  end
end

def display_welcome
  clear
  puts MESSAGES['welcome']
end

def get_result(user_choice, computer_choice)
  GAME_KEY[user_choice][computer_choice]
end

def update_score(score, result)
  if result == USER_WIN
    score[:user] += 1
  elsif result == COMPUTER_WIN
    score[:comp] += 1
  end
end

def someone_won?(score)
  score[:user] == 5 || score[:comp] == 5
end

def play_again?
  puts
  prompt(MESSAGES['play_again'])
  get_yes_or_no
end

def display_goodbye
  puts(MESSAGES['goodbye'])
end

# Main loop
loop do
  score = { user: 0, comp: 0 }

  loop do
    display_welcome
    user_choice = get_choice
    computer_choice = CHOICES.values.sample

    result = get_result(user_choice, computer_choice)
    update_score(score, result)

    display_results(user_choice, computer_choice)
    display_score(score)

    break if someone_won?(score)

    puts MESSAGES['next_round']
    gets
  end

  display_grand_winner(score)

  break unless play_again?
end

display_goodbye

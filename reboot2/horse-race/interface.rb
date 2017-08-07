def get_horses
  horses = []
  puts "Add some horses!"
  loop do
    print "🐴 > "
    horse = gets.chomp
    break if horse == ""
    horses << horse 
  end
  horses
end

def print_welcome
  puts "-" * 30
  puts " 🐴🐴🐴🐴🐴 WELCOME TO WAGON HORSE RACE 🐴🐴🐴🐴🐴 "
  puts "-" * 30
end

def swap!(array, index_1, index_2)
  array[index_1], array[index_2] = array[index_2], array[index_1]
end

def run_race!(horses)
  rand(1..10).times do
    sleep(rand(1.0..3.6))
    overtaken_horse_index = rand(0...horses.size - 1)
    # get overtaken horse
    overtaker_horse_index = overtaken_horse_index + 1
    # swap both
    # display overtaking
    `say "#{horses[overtaker_horse_index]} a dépassé #{horses[overtaken_horse_index]}"`
    swap!(horses, overtaken_horse_index, overtaker_horse_index)
  end
end

print_welcome
horses = get_horses
user_bet = gets.chomp
horses.shuffle!
p horses
# show start list with index
run_race!(horses)
p horses

if user_bet == horses.first
  puts
    `say "#{horses.first} a gagné la putain de course la famille tu vas te mettre bien"`
  else
  puts
    `say "Tu as perdu ton paris ta femme va te quitter wallah"`
end

# # on montre les cheveaux dispo



# horses.each_with_index { |horse, index| puts "Number #{index +1} - #{horse.capitalize}" }
# print "> "
# # on prend le paris
# bet = horses[gets.chomp.to_i - 1]

# # select a horse between 1 et length so we dont have the first one
# passing_horse = rand(1..horses.length - 1)

# horses[passing_horse], horses[passing_horse - 1] = horses[passing_horse - 1], horses[passing_horse]
# puts "#{passing_horse} double #{passing_horse - 1}"

# horses[passing_horse], horses[passing_horse - 1] = horses[passing_horse - 1], horses[passing_horse]
# puts "#{passing_horse} double #{passing_horse - 1}"
# # on pick un winner random

# winner = horses[0]

# # on determone si le user gagne ou perd
# if bet == winner
#   puts "#{winner.capitalize} got it! You won!"
# else
#   puts "#{winner.capitalize} got it! You lost you dumb ass!"
# end


# # course : ligne de dep et arrivée 

# # v2
# # les cheveaux se doublent (swap) horses[2], horses[1] = horses[1], horses[2] avec rand.(1..horses.length)
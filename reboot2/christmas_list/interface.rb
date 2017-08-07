require "pry-byebug"
require_relative "scraping_etsy.rb"

$list = []

def print_welcome
  puts "--------------------"
  puts "Welcome to your Christmas giftlist"
  puts "--------------------"
end

print_welcome

def print_menu
  puts "--------------------"
  puts "Which action [list|mark|add|delete|quit|idea]?"
  print "> "
end

def print_list
  if $list.empty?
    puts "Your list is empty! Add some shit"
  else
    puts "--------------------"
    puts "Items in your list:"
    $list.each_with_index do |item, index|
        puts "#{index + 1} - [#{item[:done] ? "X" : " "}] #{item[:name]}"
    end
  end
end

def add_to_list
  puts "Type in the item you want to add:"
  print "> "
  new_item = gets.chomp.capitalize
  if $list.include?(new_item) 
    puts "This item is already on your list!" 
  else
    $list << {name: new_item, done: false}
  end
end

def delete_from_list
  if $list.empty? 
    puts "nothing to delete"
  else
    puts "What item do you want to delete (index):"
    print_list
    print "> "
    item_index = gets.chomp.to_i - 1
    item_to_remove = $list[item_index]
    puts "#{item_to_remove[:name]} has been deleted from the list!"
    $list.delete(item_to_remove)
  end
end

def mark_item
  puts "What item do you want to mark:"
  print "> "
  item_index = gets.chomp.to_i - 1
  $list[item_index][:done] ? $list[item_index][:done] = false : $list[item_index][:done] = true
  # $list.find { |product| product == item_to_mark }
  # $list.delete(item_to_remove) = "[x] - #{item}"
end

def show_etsy_items
  $etsy_titles = scraper
  $etsy_titles.each_with_index do |item, index|
      puts "#{index + 1} - #{item}"
  end
end

def add_etsy_item
  puts "Pick one to add to your list (index):"
  print "> "
  item_index = gets.chomp.to_i - 1
  $list << {name: $etsy_titles[item_index], done: false}
end

loop do
  print_menu
  user_choice = gets.chomp
  case user_choice
  when "list"
    print_list
  when "mark"
    print_list
    mark_item
  when "add"
    add_to_list
  when "delete"
    delete_from_list
  when "idea"
    show_etsy_items
    add_etsy_item
  else
    exit
  end
end
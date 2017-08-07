$catalogue = [
  {
    name: "Tomate",
    price: 2
  },
  {
    name: "Bananas",
    price: 5
  },
  {
    name: "Apples",
    price: 4
  },
  {
    name: "Strawberries",
    price: 8
  }
]

$cart = []

puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"

def print_menu
  puts "1. Display catalogue"
  puts "2. Add to cart"
  puts "3. Remove from cart"
  puts "4. Print cart" # print total
  puts "5. Exit"
  print "> "
end

def show_products
  puts "--------------------"
  puts "In our store today:"
  $catalogue.each do |item|
    puts "#{item[:name]}: #{item[:price]} €"
  end
end

def add_to_cart
    # get chomp avec nom item
    added_product = gets.chomp.capitalize
    # matcher le chomp avec le h
    added_product = $catalogue.find { |product| product[:name] == added_product }
    # ajouter item cart
    $cart << added_product
end

def order_total
  $cart.reduce(0) do |sum, product|
    # puts product
    # puts :price.values
    sum + product[:price].to_i
  end
end

loop do
  print_menu
  user_choice = gets.chomp.to_i
  case user_choice
  when 1
    show_products

    puts "--------------------"
    puts "Which item? (or 'quit' to checkout)"
    add_to_cart

    puts $cart

    puts "Your order total is #{order_total}"
  when 2 then puts "Executing add_to_cart..."
  when 3 then puts "Executing remove_from_cart..."
  when 4 then puts "Executing print_cart..."
  else
    exit
  end
end
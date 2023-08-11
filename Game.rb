require 'ruby2d'

def get_input
    gets.chomp
end
set background: 'red'
set title: "Reaction Game"

puts "Welcome to Reaction game! Please insert your name."
player_name = get_input
puts "Welcome #{player_name}! This game will test your speed reactions, you will have 5 attempts. Try to finish as fast as you can."

message = Text.new(
    'Click to start game. Goodluck !',
    size: 20, 
    style: 'bold',
    color: 'black'
)

game_started = false 
square = nil
start_time = nil
duration = nil 
attempt_count = 1
attempt_limit = 6
out_of_attempt = false
sum = 0 
average = 0


on :mouse_down do |event|

        
        if game_started
        if square.contains?(event.x, event.y)
        duration = (Time.now - start_time).round(2)
        message = Text.new( "You have #{attempt_limit - (attempt_count + 1)} attempts left.")
        square.remove
        game_started = false

        if attempt_count < attempt_limit
            puts "Keep Going #{player_name}! You took #{duration} second to click !"
            attempt_count += 1
        
        end
    end
     
        if attempt_count == attempt_limit
            square.remove
            game_started = true
            out_of_attempt = true
            puts "Well done ! You have completed 5 attempts." 
            puts "Enter duration to calculate their sum. "
            5.times do |i|
                print "Enter your duration for attempt #{i + 1}: "
                input = gets.chomp
              
                value = input.to_f
                sum += (value).round(2)
              end
              puts "Your accumulated reaction time is: #{sum}"
              average = (sum / 5).round(2)
              puts "Your average reaction time is #{average} "
           
        end 
        if out_of_attempt == true
            puts "Press e to escape"
            answer = get_input
            if answer == "e" 
                break
            end
        end
    else
       message.remove      

         square = Square.new(
            x: rand(400), y: rand(400),
            size: 35, 
            color: 'blue',
            z: 10
        )

start_time = Time.now         
game_started = true
    end
end

show
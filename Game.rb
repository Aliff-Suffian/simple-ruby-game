require 'ruby2d'

set background: 'red'
set title: "Responsive Game"

Square.new(
    x: 100, y: 200,
    size: 30, 
    color: 'blue',
    z: 10
)

Text.new(
    'Click to start game',
    size: 20, 
    style: 'bold',
    color: 'black'
)
show
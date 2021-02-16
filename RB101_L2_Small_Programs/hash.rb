hash = { rock: ['lizard', 'scissors'],
         paper: ['rock', 'spock'],
         scissors: ['paper', 'lizard'],
         lizard: ['spock', 'paper'],
         spock: ['scissors', 'rock'] }

puts hash[:rock].include?('lizard')
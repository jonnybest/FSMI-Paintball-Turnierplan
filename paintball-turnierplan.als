// For the paintball tournament on May 21st

// A team
sig Team {}{
}

// all teams are playing
fact allteamsplay { all t:Team | t in Game.contestants }

// A field
abstract sig Field {	
	type : one Int
}{
	type in 0+1
}

// our fields in Haguenau
one sig Hyperball  extends Field {
}{
	type = 0
}
one sig Speedball extends Field {
}{
	type = 1
}
one sig Tactical extends Field {
}{
	type = 0
}
one sig Woodland extends Field {
}{
	type = 1
}

// A game
sig Game { 
	round : one Round,
	contestants : set Team,
	referee : one Team,
	field : one Field,
	busy : set Team
}{
	referee not in contestants
	#contestants = 2
	busy = contestants + referee
	this in round.games
}

sig Round {
	games : set Game,
	pausing : set Team
}{
	all f :pausing | f not in games.*busy
}

// a game can only happen in one round
fact restrictGametoRound {
	all g:Game | (one r: Round | g in r.games)
}

assert fieldnum { 
	# Field = 4
 }
check fieldnum for 10

// define size
fact {
	# Team = 3
	# Game = #Team
}

pred turnierplan {}

run turnierplan for 3 Team, 3 Game, 3 Round

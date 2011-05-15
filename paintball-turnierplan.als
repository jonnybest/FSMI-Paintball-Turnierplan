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
	// ref is no playing team
	referee not in contestants
	// only two playing teams
	#contestants = 2
	// busy is an alias
	busy = contestants + referee
	// make sure we have the right round
	this in round.games
}

sig Round {
	games : set Game,
	pausing : set Team
}{
	// paused teams are not allowed to play
	all x :pausing | x not in games.busy
	// a field can only be used once per round
	//no f1, f2 : games.field | f1 = f2 // WTF!!
	// a team can only be busy once per Round
	//no t1, t2 : games.busy | t1 = t2
}

// a game can only happen in one round
fact restrictGametoRound {
	//all g:Game | (one r: Round | g in r.games)
}

assert fieldnum { 
	# Field = 4
 }
check fieldnum for 10

// define sizes
fact {
	// # Team = 3
	# Game = #Team
}

pred turnierplan {
	
}

run turnierplan for exactly 3 Team, 5 Game, 5 Round

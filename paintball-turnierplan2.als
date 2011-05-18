// zweiter Ansatz fürs PB dings

// A field
abstract sig Map {	
	type : one Int
}{
	type in 0+1
}

// our fields in Haguenau
one sig Hyperball  extends Map {
}{
	type = 0
}
one sig Speedball extends Map {
}{
	type = 1
}
one sig Tactical extends Map {
}{
	type = 0
}
one sig Woodland extends Map {
}{
	type = 1
}

// A Team is a Team is a Team
sig Team {}{
	// a team needs to play some time!
	this in Match.contestants
}
// eine runde ist ein Block auf dem Spielplan
sig Round {
	match : some Match
} {
	this = match.round
	// #match > 0
}
// ein match ist ein spiel, team gegen team
sig Match {
	round : one Round,
	contestants : set Team,
	ref : one Team,
	map : one Map
}{
	this in round.match
	2 = #contestants
	ref not in contestants
}

// jedes team fact
fact {
	all a,b : Team | some m:Match | a + b in m.contestants
}

// jedes team test
assert everyteamplays {
	all a,b : Team | some m : Match | a->b in m.contestants -> m.contestants
}
check everyteamplays for 10

assert guess {
	#Match >= #Team
}
check guess for 15

// kein team zweimal busy in der selben runde
fact nodoublebooking {
	// keine refs zweimal buchen
	all r: Round, m : r.match | m.ref not in (r.match - m).ref + (r.match - m).contestants
	all r: Round, m : r.match, t : m.contestants | t not in (r.match - m).ref + (r.match - m).contestants
}
//check nodoublebooking for exactly 6 Team, 6 Match, 6 Round

// jedes Feld nur einmal pro Runde
fact maps {
	//lone r : Round | (r -> r.games.map) in (Round -> Field) 
	//no m : Match | (m.round -> m.field) in (Match - m).round -> Field
	all r : Round, m : r.match | m.map not in (r.match - m).map
}
// check maps for exactly 3 Match, 2 Round, 1 Team

pred Test {}

run Test for exactly 6 Team, 8 Round, 15 Match

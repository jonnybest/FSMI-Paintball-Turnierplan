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
sig Team {}
// eine runde ist ein Block auf dem Spielplan
sig Round {
	match : some Match
} {
	this = match.round
	#match > 1
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

run Test for exactly 13 Team, 10 Round, 13 Match

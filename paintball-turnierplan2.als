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
	match : some Match,
	pause : some Team
} {
	this = match.round
	all t: pause | t not in match.contestants + match.ref
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

// alle teams machen ungefähr gleich viel pause
fact evenPauseTime {
	//#pause.Team > 1
	all t: Team | 1 < #pause.t && #pause.t < 4
}
//check evenPauseTime for 10

// jedes team fact spielt gegen jedes andere
fact {
	all a,b : Team | some m:Match | a + b in m.contestants
}

// jedes team spielt jeden geges andere-test
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
	// keine spieler zweimal buchen
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

// jedes Team sollte jedes Feld einmal bespielt haben
fact mapskind {
	(Match.map -> Match.contestants) = (Map -> Team)
}
//check mapskind for 8

assert fillrounds {
	 no r : Round | 0 < #(r.match)
	// not for 9, 10
}
check fillrounds for 12 Team, 14 Round, exactly 66 Match

pred Test {}

//run Test for exactly 6 Team, 14 Round, exactly 16 Match
//run Test for exactly 7 Team, 14 Round, exactly 21 Match
//run Test for exactly 8 Team, 21 Round, exactly 28 Match
//run Test for exactly 9 Team, 14 Round, exactly 36 Match
//run Test for exactly 10 Team, 14 Round, exactly 45 Match
//run Test for exactly 11 Team, 14 Round, exactly 55 Match
//run Test for exactly 12 Team, 14 Round, exactly 66 Match
run Test for exactly 13 Team, exactly 20 Round, exactly 78 Match

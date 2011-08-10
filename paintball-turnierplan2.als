// # Turnierplangenerator
// für vier Felder und zwei Spielmodi
// 
// ## Autor
// Erstellt von [Jonathan Best](http://jonathanbest.de/) 
// für die [Fachschaft Mathe/Info am KIT](http://fsmi.uni-karlsruhe.de/) im April 2011
// und das Paintball-Feld in [Haguenau](http://www.paintball-haguenau.com/de/)


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
	all t: Team | 1 < #pause.t && #pause.t < 4
}

// jedes team fact spielt gegen jedes andere
fact {
	all a,b : Team | some m:Match | a + b in m.contestants
}

// jedes team spielt jeden geges andere-test
assert everyteamplays {
	all a,b : Team | some m : Match | a->b in m.contestants -> m.contestants
}
//check everyteamplays for 10

assert guess {
	#Match >= #Team
}
//check guess for 15

// kein team zweimal busy in der selben runde
fact nodoublebooking {
	// keine refs zweimal buchen
	all r: Round, m : r.match | m.ref not in (r.match - m).ref + (r.match - m).contestants
	// keine spieler zweimal buchen
	all r: Round, m : r.match, t : m.contestants | t not in (r.match - m).ref + (r.match - m).contestants
}

// jedes Feld nur einmal pro Runde
fact maps {
	all r : Round, m : r.match | m.map not in (r.match - m).map
}

// jedes Team sollte jedes Feld einmal bespielt haben
fact mapskind {
	(Match.map -> Match.contestants) = (Map -> Team)
	all t: Team, m: Map | let x =  #(contestants.t :> map.m) | { 1 < x && x < 5 }
}

pred Test {}

run Test for 5 int, exactly 13 Team, exactly 21 Round, exactly 78 Match

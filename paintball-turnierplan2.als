// zweiter Ansatz fürs PB dings

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

// A Team is a Team is a Team
sig Team {

}{

}

// A Round

pred Test {}

run Test for exactly 3 Team

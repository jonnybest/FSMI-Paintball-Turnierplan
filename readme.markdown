# Turnierplangenerator
f�r vier Felder und zwei Spielmodi

## Autor
Erstellt von [Jonathan Best](http://jonathanbest.de/) 
f�r die [Fachschaft Mathe/Info am KIT](http://fsmi.uni-karlsruhe.de/) im April 2011
und das Paintball-Feld in [Haguenau](http://www.paintball-haguenau.com/de/)

## Quickstart

0. Alle Anweisungen auf einer 64-bit Maschine mit schnellem Prozessor und viel RAM (8 GB) ausf�hren
1. Alloy Analyzer, also "alloy4.2-rc.jar" oder eine sp�tere Version (sofern kompatibel) laden und ausf�hren
2. Mit Alloy Analyzer die Datei "paintball-turnierplan2.als" laden
3. Anzahl der Spielbegegnungen berechnen: count(Match) = (count(Teams)^2 - count(Teams))/2
4. Die letzte Zeile "run Test for 5 int ..." mit den gew�nschten Parametern bef�llen, also beispielsweise "run Test for 5 int, exactly 13 Team, exactly 21 Round, exactly 78 Match" wobei der Zahlenwert f�r "Round" ein Sch�tzwert ist. Wer mehr Zeit als dieser Verfasser hat, kann auch den Parameter "exactly" vor "Round" weglassen und erh�lt damit eine L�sung mit 21 Runden oder weniger.
5. Im Men� "Options" die Punkte "Maximum Memory to use" und "Maximum Stack to use" erh�hen
6. Im Men� "Execute" den Befehl "Run Test ..." ausf�hren.
7. Kaffee trinken gehen
8. Bei Fehler: Siehe "Fehlerliste"
9. Zwei bis vier Stunden warten
10. Bei "Instance found. Predicate is consistent." auf "Instance" klicken. Ein neues Fenster �ffnet sich.
11. Im Men� "File" auf "Export To"-"XML..." klicken und speichern
12. XML-Datei und Anzeige in Alloy in Turnierplan �berf�hren
13. ???
14. Profit!

### Fehlerliste
**Fehler**: "No instance found. Predicate may be inconsistent."
**L�sung**: Fehlerhaften Parameter oder Fact finden und korrigieren

**Fehler**: Gew�hlter Satsolver crasht
**L�sung**: Sat4J w�hlen oder Im Men� "Options" die Punkte "Maximum Memory to use" und "Maximum Stack to use" verringern

**Fehler**: Integer-�berl�ufe (L�sung enth�lt negative Zahlen an unerwarteten Stellen)
**L�sung**: In der "Run"-Zeile die Integer-Breite (Parameter "int") erh�hen (default: 4)


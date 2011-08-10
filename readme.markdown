Paintball-﻿Turnierplangenerator
====================
für vier Felder und zwei Spielmodi

## Autor
Erstellt von [Jonathan Best](http://jonathanbest.de/) 
für die [Fachschaft Mathe/Info am KIT](http://fsmi.uni-karlsruhe.de/) im April 2011
und das Paintball-Feld in [Haguenau](http://www.paintball-haguenau.com/de/)

## Quickstart

0. Alle Anweisungen auf einer 64-bit Maschine mit schnellem Prozessor und viel RAM (8 GB) ausführen
1. Alloy Analyzer, also "alloy4.2-rc.jar" oder eine spätere Version (sofern kompatibel) laden und ausführen
2. Mit Alloy Analyzer die Datei "paintball-turnierplan2.als" laden
3. Anzahl der Spielbegegnungen berechnen: count(Match) = (count(Teams)^2 - count(Teams))/2
4. Die letzte Zeile "run Test for 5 int ..." mit den gewünschten Parametern befüllen, also beispielsweise "run Test for 5 int, exactly 13 Team, exactly 21 Round, exactly 78 Match" wobei der Zahlenwert für "Round" ein Schätzwert ist. Wer mehr Zeit als dieser Verfasser hat, kann auch den Parameter "exactly" vor "Round" weglassen und erhält damit eine Lösung mit 21 Runden oder weniger.
5. Im Menü "Options" die Punkte "Maximum Memory to use" und "Maximum Stack to use" erhöhen
6. Im Menü "Execute" den Befehl "Run Test ..." ausführen.
7. Kaffee trinken gehen
8. Bei Fehler: Siehe "Fehlerliste"
9. Zwei bis vier Stunden warten
10. Bei "Instance found. Predicate is consistent." auf "Instance" klicken. Ein neues Fenster öffnet sich.
11. Im Menü "File" auf "Export To"-"XML..." klicken und speichern
12. XML-Datei und Anzeige in Alloy in Turnierplan überführen
13. ???
14. Profit!

### Fehlerliste
**Fehler**: "No instance found. Predicate may be inconsistent."
**Lösung**: Fehlerhaften Parameter oder Fact finden und korrigieren

**Fehler**: Gewählter Satsolver crasht
**Lösung**: Sat4J wählen oder Im Menü "Options" die Punkte "Maximum Memory to use" und "Maximum Stack to use" verringern

**Fehler**: Integer-Überläufe (Lösung enthält negative Zahlen an unerwarteten Stellen)
**Lösung**: In der "Run"-Zeile die Integer-Breite (Parameter "int") erhöhen (default: 4)


database
	xpositive(symbol)
	xnegative(symbol)
predicates
	run
	prefs (symbol) 
	ask(symbol)
	positive(symbol)
	negative(symbol)
	remember(symbol, symbol)
	clear_facts
goal
	run.
clauses
	run :-write("Otvechat y/n\n"), prefs(X), !,
		write("\n Posetite ", X),	nl, clear_facts.
	run :-write("\n Kazhetsya, Vam luchshe ostatsya doma :("), clear_facts.     
	positive(X) :- xpositive(X), !.
	positive(X) :- not(negative(X)), !, ask(X).
	negative(X) :- xnegative(X), !.
	ask(X) :-
		write(X, "?\n"),
		readln(Reply),
		remember(X, Reply).
	remember(X, "y") :- asserta(xpositive(X)).         
	remember(X, "n") :- asserta(xnegative(X)), fail.
	clear_facts :- retract(xpositive(_)), fail.
	clear_facts :- retract(xnegative(_)), fail.
	clear_facts :- write("\n press enter"),  readchar(_).
	prefs("Kandrycyl"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
	        positive("Vy hotite na vodu"),
		positive("Boites techeniya"),
	        positive("Vam nravyatsya ozera"),
		positive("Hochetsya kupatsya"),
		positive("Hochetsya rybachit"),
	        positive("Vam nuzhen komfort"),
		positive("Nuzhen li blizki dostup k civilizatsii"),
		positive("Nuzhen li pologi peschany bereg"),!.
		
	prefs("Aslykul"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		positive("Boites techeniya"),
	        positive("Vam nravyatsya ozera"),
		positive("Hochetsya kupatsya"),
		positive("Hochetsya rybachit"),
	        positive("Vam nuzhen komfort"),
		positive("Nuzhen li blizki dostup k civilizatsii"),
		negative("Nuzhen li pologi peschany bereg"),!.
		
	prefs("Bannoe ozero"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		positive("Boites techeniya"),
	        positive("Vam nravyatsya ozera"),
		positive("Hochetsya kupatsya"),
		positive("Hochetsya rybachit"),
	        negative("Vam nuzhen komfort"),
		positive("Nuzhen li blizki dostup k civilizatsii"),!.

	prefs("Goluboe ozero"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		positive("Boites techeniya"),
	        positive("Vam nravyatsya ozera"),
		positive("Hochetsya kupatsya"),
		positive("Hochetsya rybachit"),
	        negative("Vam nuzhen komfort"),
		negative("Nuzhen li blizki dostup k civilizatsii"),!.
		
	prefs("Yumaguzinskoe vodohranilische"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		positive("Boites techeniya"),
	        negative("Vam nravyatsya ozera"),
	        positive("Mozhet byt vam podoidet vodohranilische"),
		positive("Hotite otdohnut v plavuchem domike"),!.
		
				
	prefs("Nugushskoe vodohranilische"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		positive("Boites techeniya"),
	        negative("Vam nravyatsya ozera"),
	        positive("Mozhet byt vam podoidet vodohranilische"),
		negative("Hotite otdohnut v plavuchem domike"),!.
		
	prefs("Splav po reke Inzer"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		negative("Boites techeniya"),
	        positive("Hotite na splav"),
	        positive("Hotite bystrih perekatov i extrijma"),
		positive("Hotite podolshe"),!.
		
	prefs("Splav po reke Lemeza"):-
		positive("Hotite otdohnut ot gorodskoy suety"),
		positive("Boites medvedei"),
		positive("Vy hotite na vodu"),
		negative("Boites techeniya"),
	        positive("Hotite na splav"),
	        positive("Hotite bystrih perekatov i extrijma"),
		negative("Hotite podolshe"),!.
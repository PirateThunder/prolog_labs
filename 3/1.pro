database -db
    xpositive(symbol, symbol)
    xnegative(symbol, symbol)
predicates
    run
    it_is(symbol)
    drink_is(symbol)
    ask(symbol, symbol)
    positive(symbol, symbol)
    negative(symbol, symbol)
    remember(symbol, symbol, symbol)
    clear_facts
goal
    run.
clauses
    run :-write("Answer y/n\n"), drink_is(X), !,
        write("\n The best energy drink for you is: ", X), nl, clear_facts.
    run :-write("\n Drink water"), clear_facts.
    
    positive(X, Y) :- xpositive(X, Y), !.
    positive(X, Y) :- not(negative(X, Y)), !, ask(X,Y).
    negative(X, Y) :- xnegative(X, Y), !.
    ask(X, Y) :-
        write("Does drink should ", X, " ", Y, "?\n"),
        readln(Reply),
        remember(X, Y, Reply).
    remember(X, Y, "y") :- asserta(xpositive(X, Y)).
    remember(X, Y, "n") :- asserta(xnegative(X, Y)), fail.
    
    clear_facts :- retract(xpositive(_, _)), fail.
    clear_facts :- retract(xnegative(_, _)), fail.
    clear_facts :- write("\n press enter"), readchar(_).
    
    it_is("contains caffeine"):-positive("invigorate", "for a long time").
    it_is("without caffeine"):-not(positive("invigorate", "for a long time")).
    it_is("sport drink"):-not(positive("help in recovery", "after training")).
    it_is("Litvin's energy drink"):-positive("invigorate", "for a long time").
    
    drink_is("Red Bull"):-
    it_is("contains caffeine"),
    positive("taste", "is specific"),
    positive("price", "too big"),
    positive("package", "is bright"),!.
    
    drink_is("Monster Energy"):-
    it_is("contains caffeine"),
    positive("drink", "is powerful"),
    positive("tastes", "are diverse"),
    positive("design", "is aggresive"),!.
    
    drink_is("Gatorade"):-
    it_is("sport drink"),
    positive("vitamins and mineral", "inside"),
    positive("sportsmens", "respect it"),
    positive("supplements special", "inside"),!.
    
    drink_is("Lit Energy"):-
    it_is("Litvin's energy drinkа"),
    positive("taste", "is specific"),
    positive("tastes", "are diverse"),
    positive("opportunity", "to win BMW"),!.

% y y y n y n y
% y y y y

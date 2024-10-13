database
	parent(symbol, symbol)
	sex(symbol, symbol)
domains
	name = symbol
predicates
	upload()
	save_file()
	add_parent(name, name)
	add_sex(name, name)
	delete_people(name)
	delete_parent(name, name)
	delete_sex(name)
	nondeterm change(name, name)
	nondeterm run
	nondeterm main
	nondeterm menu(name)

clauses 
	upload() :- consult("C:/VIP52/BIN/WIN/32/new.txt").	%добавляем в БД факты из файла
	add_parent(X, Y) :- not(parent(X, Y)), asserta(parent(X, Y)).	%если факта parent нет, добавляем в БД
	add_sex(X, Y) :- not(sex(X, Y)), asserta(sex(X, Y)).		%если факта sex нет, добавляем в БД
	save_file():- save("C:/VIP52/BIN/WIN/32/new.txt").	%сохраняем БД в файл
	
	delete_people(X) :- retractall(parent(X, _)), retractall(parent(_, X)), retractall(sex(X, _)).	%удаляем все факты, связанные с человеком Х из БД
	delete_parent(X, Y) :- retractall(parent(X, Y)).						%удаляем факт parent(X, Y) из БД
	delete_sex(X) :- retractall(sex(X,_)).								%удаляем факт sex(X) из БД
	
	/*меняем имя Х на У во всех фактах нашей БД*/
	change(X, Y):- parent(X, Z), sex(X, W), delete_parent(X, Z), add_parent(Y, Z), add_sex(Y, W), change(X, Y).
	change(X, Y):- parent(Z, X), delete_parent(Z, X), add_parent(Z, Y), change(X, Y).
	change(X, _):- not(parent(X, _)), not(parent(_, X)), delete_sex(X), !.
	
	run :- write("Enter your command!\nsex - add fact sex(X,Y)\nparent - add fact parent(X,Y)\ndel_sex - delete fact sex(X)\ndel_par - delete fact parent(X,Y)\n"),
	write("del_pep - delete all facts about human X\nrename - rename X to Y\nupload - upload DB from file\nsave - save DB into file\n"),
	main.
	
	main :- write("*************************\n"), readln(Com), menu(Com).

	menu("sex") :- readln(X), readln(Y), add_sex(X, Y), main.
	menu("parent") :- readln(X), readln(Y), add_parent(X, Y), main.
	menu("del_pep") :- readln(X), delete_people(X), main.
	menu("del_sex") :- readln(X), delete_sex(X), main.
	menu("del_par") :- readln(X), readln(Y), delete_parent(X, Y), main.
	menu("rename") :- readln(X), readln(Y), change(X, Y), main.
	menu("upload") :- upload(), main.
	menu("save") :- save_file(), main.
	menu(_) :- write("Program stopped.\n"), !.
	

goal
	run.

% parent
% jake
% jane
% sex
% jake
% male
% sex
% jane
% female
% save

man(artem).
man(arsen).
man(sergei).
man(misha).
writetext(punk).
writetext(rap).
writetext(pop).
writetext(metal).

%Пассажир купе будет описываться фактом passenger(Name, Read, Buy, Write).

solve(Solve):-
  Solve = [passenger(X, XRead, XBuy, XWrite), passenger(Y, YRead, YBuy, YWrite),
          passenger(Z, ZRead, ZBuy, ZWrite), passenger(W, WRead, WBuy, WWrite)],
  % 4 разных пасажира
  man(X), man(Y), man(Z), man(W), unique([X, Y, Z, W]),
  % каждый написал текст
  writetext(XWrite), writetext(YWrite),
  writetext(ZWrite), writetext(WWrite),
  unique([XWrite, YWrite, ZWrite, WWrite]),
  % каждый купил текст
  writetext(XBuy), writetext(YBuy),
  writetext(ZBuy), writetext(WBuy),
  unique([XBuy, YBuy, ZBuy, WBuy]),
  % каждый читает текст
  writetext(XRead), writetext(YRead),
  writetext(ZRead), writetext(WRead),
  unique([XRead, YRead, ZRead, WRead]),
  % реппер читает металл
  member(passenger(_, metal, _, rap), Solve),
  % поп-музыкант читает не панк
  not(member(passenger(_, punk, _, pop), Solve)),
  % поп-музыкант не покупал панк
  not(member(passenger(_, _, punk, pop), Solve)),
  % никто не читает и не покупал свою книгу
  check(Solve),
  % артём и арсен обменялись книгами
  member(passenger(artem, ArtemRead, ArtemBuy, _), Solve),
  member(passenger(arsen, ArtemBuy, ArtemRead, _), Solve),
  % арсен купил произведение миши
  member(passenger(misha, _, _, MishaWrite), Solve),
  member(passenger(arsen, MishaWrite, _, _), Solve).

check([]):-!.
check([passenger(_, XRead, XBuy, XWrite)|T]):-
  !, not(XRead = XWrite), not(XBuy = XWrite), check(T).

unique([]):-!.
unique([Head|Tail]):-
   member(Head, Tail), !, fail;
   unique(Tail).

% solve(X),X=[passenger(artem,_,_,_),passenger(arsen,_,_,_),passenger(sergei,_,_,_),passenger(misha,_,_,_)].
%% Декларативное определение натуральных чисел
	ints(0).
	ints(X) :- ints(Y), X is Y + 1.

	%% Совершенное число - это 1) натуральное число 2) сумма делителей равна числу
	perfect_number(X) :- ints(X), Y is X - 1, calculatesum_divisors_till(Sum, X, Y), Sum = X.

	%% Проверка суммы делителей 1-й аргумент Сумма, 2-й - число для которого ищем делители, 
        %%  3-е - число до которого ищем делители
	calculatesum_divisors_till(0, _NumberToDivide, 0).
	calculatesum_divisors_till(Sum, NumberToDivide, Till) :- Till > 0,
                Rem is NumberToDivide mod Till,  Rem = 0,  Ts is Till - 1, 
                calculatesum_divisors_till(SumPrev, NumberToDivide, Ts),
	        Sum is SumPrev + Till.

	calculatesum_divisors_till(Sum, NumberToDivide, Till) :- Till > 0, 
                Rem is NumberToDivide mod Till, Rem > 0, Ts is Till - 1, 
                calculatesum_divisors_till(Sum, NumberToDivide, Ts).

  % perfect_number(X),X<10000

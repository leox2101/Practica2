% ------------Catálogo de vehículos---------------

% Base de datos de vehículos actualizada

% Toyota
vehicle(toyota, corolla, sedan, 17953, 2022).
vehicle(toyota, camry, sedan, 25000, 2023).
vehicle(toyota, yaris, sedan, 16000, 2021).
vehicle(toyota, 'rav4', suv, 28771, 2023).
vehicle(toyota, highlander, suv, 36420, 2023).
vehicle(toyota, '4runner', suv, 37305, 2022).
vehicle(toyota, tundra, pickup, 31371, 2021).
vehicle(toyota, tacoma, pickup, 28000, 2022).
vehicle(toyota, hilux, pickup, 27000, 2023).
vehicle(toyota, supra, sport, 43540, 2022).
vehicle(toyota, 'gr86', sport, 28000, 2023).
vehicle(toyota, '86', sport, 27000, 2021).

% Ford
vehicle(ford, fiesta, sedan, 18000, 2020).
vehicle(ford, focus, sedan, 20000, 2021).
vehicle(ford, fusion, sedan, 22000, 2020).
vehicle(ford, escape, suv, 27000, 2023).
vehicle(ford, edge, suv, 32000, 2022).
vehicle(ford, explorer, suv, 36000, 2023).
vehicle(ford, 'f150', pickup, 39974, 2022).
vehicle(ford, ranger, pickup, 30000, 2023).
vehicle(ford, maverick, pickup, 25000, 2022).
vehicle(ford, mustang, sport, 29165, 2023).
vehicle(ford, mustang_gt, sport, 36000, 2023).
vehicle(ford, 'mustang_1967', sport, 55000, 1967).

% BMW
vehicle(bmw, 'series3', sedan, 23267, 2021).
vehicle(bmw, 'series5', sedan, 30000, 2022).
vehicle(bmw, '2002tii', sedan, 45000, 1973).
vehicle(bmw, 'x1', suv, 35000, 2023).
vehicle(bmw, 'x3', suv, 42000, 2022).
vehicle(bmw, 'x5', suv, 60000, 2021).
vehicle(bmw, 'm3', sport, 67808, 2022).
vehicle(bmw, 'm4', sport, 72000, 2023).
vehicle(bmw, 'z4', sport, 50000, 2022).
vehicle(bmw, 'x7', pickup, 65000, 2023). 
vehicle(bmw, 'x8', pickup, 70000, 2023). 
vehicle(bmw, 'x9', pickup, 75000, 2023). 

% Chevrolet
vehicle(chevrolet, cruze, sedan, 19000, 2019).
vehicle(chevrolet, malibu, sedan, 23000, 2021).
vehicle(chevrolet, spark, sedan, 15000, 2022).
vehicle(chevrolet, blazer, suv, 33000, 2022).
vehicle(chevrolet, equinox, suv, 28000, 2023).
vehicle(chevrolet, traverse, suv, 35000, 2022).
vehicle(chevrolet, silverado, pickup, 42000, 2021).
vehicle(chevrolet, colorado, pickup, 30000, 2022).
vehicle(chevrolet, montana, pickup, 25000, 2023).
vehicle(chevrolet, camaro, sport, 47000, 2023).
vehicle(chevrolet, corvette, sport, 65000, 2023).
vehicle(chevrolet, 'camaro_1969', sport, 60000, 1969).



%---Filtrar por tipo y presupuesto--------
meet_budget(Type, BudgetMax, Vs) :-
    findall(Ref, 
        (vehicle(_, Ref, Type, Price, _), Price =< BudgetMax),
        Vs).


every_brand(Brand, L):-
	bagof((R,T,A),vehicle(Brand,R,T,_,A),L).

% Result = report(ListaVehículos, TotalPrecio)

generate_report(Brand, Type, Budget, list_total(Vehicles, Total)) :-
    findall(
        (Ref, Price),
        ( vehicle(Brand, Ref, Type, Price, _), 
          Price =< Budget
        ),
        Vehicles
    ),
    sum_prices(Vehicles, Total),
    Total =< 1000000.

sum_prices(Vs, Total) :-
    sum_prices(Vs, 0, Total).

sum_prices([], Acc, Acc).
sum_prices([(_,P)|Rest], Acc, Total) :-
    NewAcc is Acc + P,
    sum_prices(Rest, NewAcc, Total).

% Test cases
% 1. findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 30000), R).
% 2. bagof((T,Y),vehicle(ford,_,T,_,Y),B).
% 3. findall((R,P),vehicle(_,R,sedan,P,_),Vs),sum_prices(Vs,T),T =< 500000.

% meet_budget(suv,35000, Vs).
% every_brand(chevrolet, L).
% generate_report(bmw, sport, 80000, R).
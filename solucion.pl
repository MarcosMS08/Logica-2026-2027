%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Copyright (C)2026 Joaquín Arias (URJC)
%  Name: practica_2026_2027.pl
%  Author: Joaquín Arias
%  Version 1.0
%  Date: 27 Septiembre 2026
%  LICENSE: Apache License 2.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Operator precedence
:- op(200, fy, !).
:- op(400, xfy,[and, or]).
:- op(600, xfy,[-->, <->]).
% Auxiliary precedence for !
% Used to define the inference rules
:- op(400, xfy, !).

:- discontiguous rule/4, proof/2.
rule(_,_,_,_) :- fail. %% 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Añade la solucion de los ejercicios 1-10   %%
%%    corresponde al fichero solucion.pl      %%
%%                                            %%
%%      Comprobar con ?- main.                %%


alumno('Marcos Martinez Sanchez', 'm.martinezs.2026@alumnos.urjc.es', 'Ciber').

%% Este ejercicio esta ya resuelto
proof(ejercicio01,
      [
          'Premisa'(1),
          'E' and b(1),
          'Premisa'(2),
          'Premisa'(3),
          'E' or (2, 3, 4),
          'E' and a(1),
          'I' and (6, 5)
      ]).



% Incluir el resto de demostraciones

proof(ejercicio02,
      [
         'Premisa'(1),
         'I' ! (1),
         'E' ! (2)
      ]).

proof(ejercicio03,
      [
         'Premisa'(1),
         'Premisa'(2),
         mt(1, 2),
         dm1(3)

      ]).

proof(ejercicio04,
      [
         'Premisa'(1),
         'Premisa'(2),
         'Premisa'(3),
         'Premisa'(4),
         mt(2,4),
         corte1(1,5),
         'E' --> (3,6) 
    ]).

proof(ejercicio05,
      [
         'Premisa'(1),
         'Premisa'(2),
         'Premisa'(3),
         'I' and (2,3),
         dm2(4),
         mt(1,5)

    ]).

proof(ejercicio06,
      [
         'Premisa'(1),
         'Supuesto'(p and !r),
         'E' and a(2),
         'E' and b(2),
         mt(1,4),
         dm1(5),
         'Supuesto'(!p),
         'I' and (3,7),
         'I' --> (7,8),
         'I' ! (9),
         corte1(6,10),
         'I' --> (2,11)  
    ]).

proof(ejercicio07,
      [
         'Premisa'(1),
         'Premisa'(2),
         'Premisa'(3),
         corte2(1,2),
         corte2(4,3),
         'Supuesto'(r),
         'I' --> (6,6),
         'E' or (5,7,7)
    ]).

proof(ejercicio08,
      [
          'Supuesto'(!p or q),      
          'Supuesto'(q --> r),     
          'Supuesto'(p),           
          'Supuesto'(!p),           
          'I' and (3,4),             
          'I' --> (4,5),            
          'I' ! (6),                
          corte1(1,7),               
          'E' --> (2,8),            
          'I' --> (3,9),            
          'I' --> (2,10),            
          'I' --> (1,11)             
      ]).

proof(ejercicio09,
      [
        'Premisa'(1),                  
        'Premisa'(2),
        'Premisa'(3),
        'Premisa'(4),
        'Premisa'(5),
        mt(2,3),
        corte1(4,5),
        'Supuesto'(p)
        'I' and (8,7),
        'E' --> (1,9),
        'I' and (10,6)
        'I' --> (8,11),
        'I' ! (12)      
      ]).      

%% Puedes incluir reglas derivadas %%
rule(mt,
    [A --> B, !B],
    !A,
    [
        'Premisa'(1),                  
        'Premisa'(2),                  
        'Supuesto'(A),                 
        'E' --> (1,3),                 
        'I' and (4,2),                
        'I' --> (3,5),                
        'I' ! (6)                      
    ]).

rule(dm1,
    [!(A and B)],
    !A or !B,
    [
        'Premisa'(1),                
        'Supuesto'(!(!A or !B)),      
        'Supuesto'(A),                
        'Supuesto'(B),                
        'I' and (3,4),                 
        'I' and (5,1),                 
        'I' --> (4,6),                
        'I' ! (7),                    
        'I' or b(!A, 8),              
        'I' and (9,2),                 
        'I' --> (3,10),               
        'I' ! (11),                   
        'I' or a(12, !B),            
        'I' and (13,2),                
        'I' --> (2,14),                
        'I' ! (15),                   
        'E' ! (16)                    
    ]).
rule(dm2,
    [!A and !B],
    !(A or B),
    [
        'Premisa'(1),                 
        'E' and a(1),                
        'E' and b(1),                 
        'Supuesto'(A or B),           
        'Supuesto'(A),                 
        'I' and (5,2),                
        'I' --> (5,6),                 
        'Supuesto'(B),                
        'Supuesto'(!(A and !A)),      
        'I' and (8,3),                 
        'I' --> (9,10),               
        'I' ! (11),                   
        'E' ! (12),                  
        'I' --> (8,13),               
        'E' or (4,7,14),               
        'I' --> (4,15),               
        'I' ! (16)                    
    ]).


rule(corte1,
    [A or B, !A],
    B,
    [
        'Premisa'(1),                 
        'Premisa'(2),                  
        'Supuesto'(A),                
        'Supuesto'(!B),              
        'I' and (3,2),                
        'I' --> (4,5),                
        'I' ! (6),                    
        'E' ! (7),                    
        'I' --> (3,8),                
        'Supuesto'(B),                
        'I' --> (10,10),              
        'E' or (1,9,11)               
    ]).

rule(corte2,
    [A or B, !A or C],
    B or C,
    [
        'Premisa'(1),                 
        'Premisa'(2),                 
        'Supuesto'(A),                 
        'Supuesto'(!A),                
        'Supuesto'(!C),               
        'I' and (3,4),                
        'I' --> (5,6),                
        'I' ! (7),                    
        'E' ! (8),                     
        'I' --> (4,9),                
        'Supuesto'(C),                
        'I' --> (11,11),              
        'E' or (2,10,12),              
        'I' or b(B,13),               
        'I' --> (3,14),                
        'Supuesto'(B),                
        'I' or a(16,C),               
        'I' --> (16,17),               
        'E' or (1,15,18)              
    ]).

rule(corte3,
    [A or B, !B],
    A,
    [
        'Premisa'(1),                 
        'Premisa'(2),                  
        'Supuesto'(A),                
        'I' --> (3,3),               
        'Supuesto'(B),                
        'Supuesto'(!A),               
        'I' and (5,2),                 
        'I' --> (6,7),                
        'I' ! (8),                    
        'E' ! (9),                   
        'I' --> (5,10),               
        'E' or (1,4,11)                
    ]).

%%        FIN fichero solucion.pl             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% Fichero practica.pl %%%
% Ejemplo diapositiva 48 del tema 2
enunciado(ejercicio01,
          [
              s and p or q,
              p --> ! r,
              q --> ! r
          ],
          s and ! r
         ).

enunciado(ejercicio02,
          [
              !p --> q and !q
          ],
          p
         ).

enunciado(ejercicio03,
          [
              p and q --> r,
              !r
          ],
          !p or !q
         ).

enunciado(ejercicio04,
          [
              p or q,
              p --> r,
              q --> s,
              !r
          ],
          s
         ).

enunciado(ejercicio05,
          [
              p --> q or r,
              !q,
              !r
          ],
          !p
         ).

enunciado(ejercicio06,
          [
              p and q --> r
          ],
          p and !r --> !q
         ).

enunciado(ejercicio07,
          [
              p or q,
              !p or r,
              !q or r
          ],
          r
         ).

enunciado(ejercicio08,
          [],
          (!p or q) --> (q --> r) --> p --> r
         ).

enunciado(ejercicio09,
          [
              p and q --> r,
              r --> s,
              !s,
              t or q,
              !t
          ],
          !p
         ).

enunciado(ejercicio10,
          [
              p or q,
              p --> r and s,
              q --> t,
              !r or !v,
              t --> !w,
              !v --> w
          ],
          !(v and w) and !p or !q
         ).

test(
    [
        ejercicio01,
        ejercicio02,
        ejercicio03,
        ejercicio04,
        ejercicio05,
        ejercicio06,
        ejercicio07,
        ejercicio08,
        ejercicio09,
        ejercicio10,
        fin
    ]).
%%% Fin practica.pl %%%


:- data counter/1, formula/2, tabular/1, closed/1, opened/1, check/1.
dn(Hypotheses, Deduction, Proof) :-
    retractall(counter(_)), retractall(formula(_,_)), retractall(tabular(_)),retractall(closed(_)),retractall(opened(_)),retractall(check(_)),
    assert(counter(0)), assert(tabular(0)),
    format(" T~p  |-  ~p\n\n",[Hypotheses, Deduction]),
    eval(Hypotheses, Deduction, Proof),
    check_pending.

check_pending :-
    setof(Name, check(Name), Pending), !,
    check_pending_(Pending).
check_pending.

check_pending_([]).
check_pending_([Name|Ns]) :-
    retractall(counter(_)),retractall(formula(_,_)), retractall(tabular(_)),retractall(closed(_)),retractall(opened(_)),
    assert(counter(0)), assert(tabular(0)),
    rule(Name, Hypotheses, Deduction, Proof), !,
    numbervars([Hypotheses, Deduction, Proof], 0, _),
    format("\n\n Demostración de la regla auxiliar ~p:  T~p  |-  ~p\n\n",[Name,Hypotheses,Deduction]),
    eval(Hypotheses, Deduction, Proof), !,
    check_pending_(Ns).

eval(Hypotheses, Deduction, [ Rule | Proof ]) :-
    eval_rule(Rule, Hypotheses),
    eval(Hypotheses, Deduction, Proof).
eval(_, Deduction, []) :-
    check_deduccion(Deduction).

eval_rule(R, P):-
    (   exec(R, P) ->
        output(R)
    ;
        format("\nFALLO: No se puede aplicar la regla \t\t~p\n\n", [R]), !, fail
    ).

exec('Premisa'(C), Hypotheses) :- !,
    'Premisa'(C, Hypotheses).
exec(Rule,_) :-
    Rule =.. [Name|Args],
    rule(Name,Hypotheses, Deduction, _Proof), !,
    assert(check(Name)),
    exec_rule(Args, Hypotheses, Deduction).
exec(Rule,_) :-
    catch(call(Rule),_,fail).

'Premisa'(1,[P | _Hypotheses]) :- !,
    add_formula(P).
'Premisa'(A,[_ | Hypotheses]) :-
    A1 is A - 1,
    'Premisa'(A1, Hypotheses).

exec_rule(Args, Hypotheses, Deduction) :-
    see_formulas(Args, Formulas),
    Hypotheses = Formulas,
    add_formula(Deduction).
see_formulas([],[]).
see_formulas([A|As], [FA|FAs]) :-
    formula(A, FA),
    see_formulas(As, FAs).

check_deduccion(Deduction) :-
    retract(counter(C)),
    formula(C, Formula),
    (   opened(_) ->
        findall(A, opened(A), LA),
        format("\nFALLO: Supuesto(s) '~w' no está(n) cerrado(s)\n\n",[LA]),!,fail
    ;
        (   Formula = Deduction ->
            format("~50|ok",[])
        ;
            format("\nFALLO: Se demuestra '~w' en lugar de '~w'\n\n",[Formula,Deduction]),!,fail
        )
    ).

add_formula(Formula) :-
    next_couonter(C),
    asserta(formula(C, Formula)).

next_couonter(C1) :-
    retract(counter(C)),
    C1 is C + 1,
    asserta(counter(C1)).
    

output(Rule) :-
    tabular(T),
    counter(C),
    formula(C, Formula),
    format("  ~p~5|",[C]),
    format_tabular(T),
    format("~p",[Formula]),
    format("~50|~p\n",[Rule]).    

increase_tab :-
    retract(tabular(Tab)),
    Tab1 is Tab + 1,
    assert(tabular(Tab1)).
decrease_tab :-
    retract(tabular(Tab)),
    Tab1 is Tab - 1,
    assert(tabular(Tab1)).

format_tabular(0) :- !.
format_tabular(T) :-
    T1 is T - 1,
    format("     ",[]),
    format_tabular(T1).


%% Inference Rules
% Conjunction
'I' and (A, B) :-
    formula(A, FA), is_valid(A),
    formula(B, FB), is_valid(B),
    add_formula(FA and FB).

'E' and a(A) :-
    formula(A, FA and _FB), is_valid(A),
    add_formula(FA).
'E' and b(A) :-
    formula(A, _FA and FB), is_valid(A),
    add_formula(FB).
% Disjuncion
'E' or (A, B, C) :-
    formula(A, FB or FC), is_valid(A),
    formula(B, FB --> F), is_valid(B),
    formula(C, FC --> F), is_valid(C),
    add_formula(F).

'I' or a(A, Formula) :-
    formula(A, FA), is_valid(A),
    add_formula(FA or Formula).
'I' or b(Formula, B) :-
    formula(B, FB), is_valid(B),
    add_formula(Formula or FB).
% Negation
'I' ! (A) :-
    formula(A, FA --> B and ! B), is_valid(A),
    add_formula(! FA).

'E' ! (A) :-
    formula(A, ! ! FA), is_valid(A),
    add_formula(FA).
% Implication
'E' --> (A, B) :-
    formula(A, FB --> FC), is_valid(A),
    formula(B, FB), is_valid(B),
    add_formula(FC).
'I' --> (A, B) :-
    formula(A, FA), is_valid(A),
    last_opened(A),
    formula(B, FB), is_valid(B),
    close_assumption(A),
    add_formula(FA --> FB).
'Supuesto'(FA) :-
    increase_tab,
    add_formula(FA),
    counter(C),
    asserta(opened(C)).
% Bi-Implication
'I' <-> (A, B) :-
    formula(A, FA --> FB), is_valid(A),
    formula(B, FB --> FA), is_valid(B),
    add_formula(FA <-> FB).
'E' <-> a(A) :-
        formula(A, FA <-> FB), is_valid(A),
        add_formula(FA --> FB).
'E' <-> b(A) :-
        formula(A, FA <-> FB), is_valid(A),
        add_formula(FB --> FA).

% Auxiliary predicates
last_opened(A) :-
    retract(opened(L)),
    (   L = A ->
        true
    ;
        format("\nFALLO: Cerrar antes el supuesto '~w'", [L]), !, fail
    ).
is_valid(A) :-
    (   valid(A) ->
        true
    ;
        format("\nFALLO: La fórmula '~p' está en un supuesto cerrado", [A]), !, fail
    ).
valid(B) :-
    \+ closed(B).
close_assumption(A) :-
    counter(C),
    between(A, C, C1),
    assert(closed(C1)),
    fail.
close_assumption(_A) :-
    decrease_tab.



main :-
    alumno(Name,Mail,Grade),
    format("\nAlumno = ~p",[Name]),
    format("\nCorreo electrónico = ~p",[Mail]),
    format("\nGrado = ~p\n\n",[Grade]),
    eval_test(0,Nota),
    format("\nNota Practica = ~p\n\n",[Nota]).
    
eval_test(N,Nota) :-
    test(Tests),
    eval_test_(Tests,N,Nota).

eval_test_([fin],Nota,Nota).
eval_test_([T|Ts],Nin,Nout) :-
    enunciado(T,Premisas,Consecuente),
    format("\n* Evaluar: ~p\n",[T]),
    (  proof(T,Proof),
       format("Comprobar demostración: ~p\n\n", [Proof]),
       dn(Premisas,Consecuente,Proof) ->
        Nmid is Nin + 1
    ;
        Nmid is Nin
    ),
    eval_test_(Ts,Nmid,Nout).
            

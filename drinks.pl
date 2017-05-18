%Como usar:
%No terminal, dentro do swipl, digite: 
%[drinks].
%menu.

%ingredientes da aplicacao
ingrediente(rum).
ingrediente(acucar).
ingrediente(sucoDeLimao).
ingrediente(aguaComGas).
ingrediente(hortela).
ingrediente(tequila). 
ingrediente(sal).
ingrediente(licorDeLaranja).
ingrediente(refrigeranteDeCola).
ingrediente(leiteDeCoco).
ingrediente(sucoDeAbacaxi).
ingrediente(vodka).
ingrediente(limao).

%receitas da aplicacao
receita(margarita,[tequila,sal,sucoDeLimao,licorDeLaranja,r]).
receita(mojito,[rum,acucar,sucoDeLimao,aguaComGas,hortela,r]).
receita(cubaLibre,[rum,sucoDeLimao,refrigeranteDeCola,r]).
receita(pinaColada,[rum,leiteDeCoco,sucoDeAbacaxi,r]).
receita(caipirinha,[vodka,limao,r]).

%Manipulacao da lista de receitas

pertence(X,[X|_]).

podeFazer(D):- receita(D,[H|T]), contemTudo(D,[H|T]).

contemTudo(_,[_|T]):- T=[].
contemTudo(D,[H|T]):- ingredienteDoUsuario(I),pertence(I,[H]),contemTudo(D,T).

%letras

a:- receberIngredientes.
b:- ingredienteDoUsuario(I), write(I), nl, fail.
c:- podeFazer(D), write(D), nl, fail.
d:- drinks(D), write(D), nl, fail.
e:- conteudo.

s:-true.
n:-false.

%menu.
menu:-
  write('Ola, bem vindo ao suporte a Drinks. Escolha uma opcao:'),nl,
  write('a. - Informar seus ingredientes.'),nl,
  write('b. - Ver seus ingredientes.'),nl,
  write('c. - Ver o que pode fazer com seus ingredientes.'),nl,
  write('d. - Ver lista de drinks.'),nl,
  write('e. - Ver ingrediente dos drinks.'),nl,
  write('obs: Lembe-se de inserir um . apos as letras.').
  



%a. -Informar ingredientes
receberIngredientes:-
  esqueceIngrDoUsr;
  ingrediente(I), 
  write('voce possui '), 
  write(I), 
  write('?(s./n.)'), 
  nl,
  read(X),
  ifThenElse(X,salva(I),fail).

%d. -Lista de drinks

drinks(D):- receita(D,_).

%e. -Conteudo dos drinks

conteudo:- receita(D,I), write(D), write(I), nl, fail.
  

%if
ifThenElse(X,Y,_):-X,!,Y.
ifThenElse(_,_,Z):-Z.

%manipula ingrediente do usuario
salva(I):- memoriza(ingredienteDoUsuario(I)),fail.

:-dynamic ingredienteDoUsuario/1.

esqueceIngrDoUsr:- ingredienteDoUsuario(X), retract(ingredienteDoUsuario(X)), fail.

memoriza(X):-assert(X).


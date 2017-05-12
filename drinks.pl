%Como usar:
%No terminal, dentro do swipl, digite: 
%[drinks].
%podeFazer(X).
%incluir(rum).
%podeFazer(X).


%ingrediente(rum).
ingrediente(acucar).
ingrediente(sucoDeLimao).
ingrediente(aguaComGas).
ingrediente(hortela).
ingrediente(tequila).
ingrediente(sal).
ingrediente(licorDeLaranja).
ingrediente(refrigeranteDeCola).

incluir(X):- assert(ingrediente(X)).

%receitas
receita(margarita,[tequila,sal,sucoDeLimao,licorDeLaranja]).
receita(mojito,[rum,acucar,sucoDeLimao,aguaComGas,hortela]).
receita(cubaLibre,[rum,sucoDeLimao,refrigeranteDeCola]).
receita(pinaColada,[rum,leiteDeCoco,sucoDeAbacaxi]).
receita(caipirinha,[vodka,limao]).

%Manipulacao da lista da receita

pertence(X,[X|Z]).

podeFazer(D):- receita(D,[H|T]), contemTudo(D,[H|T]).

contemTudo(D,[H|T]):- T=[].
contemTudo(D,[H|T]):- ingrediente(I),pertence(I,[H]),contemTudo(D,T).

%drinks

drinks(D):- receita(D,_).

%conteudo dos drinks

conteudo(D):- receita(D,I), write(I).

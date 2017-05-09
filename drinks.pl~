
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

%dinks

drink(margarita).
drink(mojito).
drink(cubaLibre).
drink(pinaColada).


%conteudo dos drinks

conteudo(D):- findall(I,contem(D,I),L).% write(I),nl, fail. --INCOMPLETO

contem(margarita,tequila).
contem(margarita,sal).
contem(margarita,sucoDeLimao).
contem(margarita,licorDeLaranja).


contem(mojito,rum).
contem(mojito,acucar).
contem(mojito,sucoDeLimao).
contem(mojito,aguaComGas).
contem(mojito,hortela).


contem(cubaLibre,rum).
contem(cubaLibre,sucoDeLimao).
contem(cubaLibre,refrigeranteDeCola).

contem(pinaColada,rum).
contem(pinaColada,leiteDeCoco).
contem(pinaColada,sucoDeAbacaxi).


resolve(Sol) :-
   Sol = fila(_,_,_,_,_),
%Na quinta posição está o homem que vai gastar menos.%
   quinta(A,Sol),
   gastar(A,50),
%William está em algum lugar à esquerda do homem de camiseta Amarela.%
   algum_lugar_esquerda(B,C,Sol),
   nome(B,william),
   camiseta(C,amarela),
%Em uma das pontas está quem vai comprar uma Sandália.%
   uma_das_pontas(D,Sol),
   presente(D,sandalia),
%O filho da Cristiane está ao lado de quem vai gastar R$ 50.%
   aolado(E,F,Sol),
   mae(E,cristiane),
   gastar(F,50),
%O homem de Vermelho está ao lado do filho da Denise.%
   aolado(G,H,Sol),
   camiseta(G,vermelha),
   mae(H,denise),
%Quem vai comprar um Vestido está em algum lugar à direita do Douglas.%
   algum_lugar_direita(I,J,Sol),
   presente(I,vestido),
   nome(J,douglas),
%Cristiane vai ganhar um presente de R$ 200.%
   filho(K,Sol),
   mae(K,cristiane),
   gastar(K,200),
%O homem de 26 anos está exatamente à direita do Julio.%
   exatamente_direita(L,M,Sol),
   idade(L,26),
   nome(M,julio),
%Em uma das pontas está o rapaz de camiseta Amarela.%
   uma_das_pontas(N,Sol),
   camiseta(N,amarela),
%Karina vai receber um presente de R$ 100.%
   filho(O,Sol),
   mae(O,karina),
   gastar(O,100),
%Douglas está ao lado do filho da Karina.%
   aolado(P,Q,Sol),
   nome(P,douglas),
   mae(Q,karina),
%O homem mais velho está na quinta posição.%
   quinta(R,Sol),
   idade(R,29),
%O rapaz de Verde está exatamente à esquerda do de Branco.%
   exatamente_esquerda(S,T,Sol),
   camiseta(S,verde),
   camiseta(T,branca),
%Quem vai comprar uma Bolsa está exatamente à direita de quem vai comprar um Vestido.%
   exatamente_direita(U,V,Sol),
   presente(U,bolsa),
   presente(V,vestido),
%O filho da Karina está ao lado de quem vai comprar uma Bolsa.%
   aolado(W,X,Sol),
   mae(W,karina),
   presente(X,bolsa),
%Quem vai comprar um Perfume está ao lado de quem vai gastar R$ 100.%
   aolado(Y,Z,Sol),
   presente(Y,perfume),
   gastar(Z,100),
%Quem vai comprar o presente mais caro está exatamente à esquerda de quem está de Vermelho.%
   exatamente_esquerda(Z1,Z2,Sol),
   gastar(Z1,300),
   camiseta(Z2,vermelha),
%Na terceira posição está o rapaz da camiseta Verde.%
   terceira(Z3,Sol),
   camiseta(Z3,verde),
%Julio tem 27 anos.
   filho(Z4,Sol),
    nome(Z4,julio),
   idade(Z4,27),
%Danilo está ao lado do filho da Karina.%
   aolado(Z5,Z6,Sol),
   nome(Z5,danilo),
   mae(Z6,karina),
%Denise vai ganhar um par de Brincos do seu filho.%
   filho(Z7,Sol),
   mae(Z7,denise),
   presente(Z7,brincos),
%O filho da Mônica está em uma das pontas.%
   uma_das_pontas(Z8,Sol),
   mae(Z8,monica),
%O rapaz de Azul está ao lado do rapaz de 28 anos.%
   aolado(Z9,Z10,Sol),
   camiseta(Z9,azul),
   idade(Z10,28),
%Fechamento%
   filho(Z11,Sol),
   nome(Z11,rogerio),
   filho(Z12,Sol),
   idade(Z12,25),
   filho(Z13,Sol),
   gastar(Z13,75),
   filho(Z14,Sol),
   mae(Z14,paula).

filho(X,fila(X,_,_,_,_)).
filho(X,fila(_,X,_,_,_)).
filho(X,fila(_,_,X,_,_)).
filho(X,fila(_,_,_,X,_)).
filho(X,fila(_,_,_,_,X)).

nome(filho(X,_,_,_,_,_),X).
camiseta(filho(_,X,_,_,_,_),X).
idade(filho(_,_,X,_,_,_),X).
presente(filho(_,_,_,X,_,_),X).
gastar(filho(_,_,_,_,X,_),X).
mae(filho(_,_,_,_,_,X),X).

uma_das_pontas(X,fila(X,_,_,_,_)).
uma_das_pontas(X,fila(_,_,_,_,X)).

aolado(X,Y,fila(X,Y,_,_,_)).
aolado(X,Y,fila(Y,X,_,_,_)).
aolado(X,Y,fila(_,X,Y,_,_)).
aolado(X,Y,fila(_,Y,X,_,_)).
aolado(X,Y,fila(_,_,X,Y,_)).
aolado(X,Y,fila(_,_,Y,X,_)).
aolado(X,Y,fila(_,_,_,X,Y)).
aolado(X,Y,fila(_,_,_,Y,X)).

primeira(X,fila(X,_,_,_,_)).
segunda(X,fila(_,X,_,_,_)).
terceira(X,fila(_,_,X,_,_)).
quarta(X,fila(_,_,_,X,_)).
quinta(X,fila(_,_,_,_,X)).

exatamente_esquerda(X,Y,fila(X,Y,_,_,_)).
exatamente_esquerda(X,Y,fila(_,X,Y,_,_)).
exatamente_esquerda(X,Y,fila(_,_,X,Y,_)).
exatamente_esquerda(X,Y,fila(_,_,_,X,Y)).

exatamente_direita(X,Y,Fila) :-
    exatamente_esquerda(Y,X,Fila).

algum_lugar_direita(X,Y,fila(Y,X,_,_,_)).
algum_lugar_direita(X,Y,fila(Y,_,X,_,_)).
algum_lugar_direita(X,Y,fila(Y,_,_,X,_)).
algum_lugar_direita(X,Y,fila(Y,_,_,_,X)).
algum_lugar_direita(X,Y,fila(_,Y,X,_,_)).
algum_lugar_direita(X,Y,fila(_,Y,_,X,_)).
algum_lugar_direita(X,Y,fila(_,Y,_,_,X)).
algum_lugar_direita(X,Y,fila(_,_,Y,X,_)).
algum_lugar_direita(X,Y,fila(_,_,Y,_,X)).
algum_lugar_direita(X,Y,fila(_,_,_,Y,X)).

algum_lugar_esquerda(X,Y,Fila) :-
    algum_lugar_direita(Y,X,Fila).

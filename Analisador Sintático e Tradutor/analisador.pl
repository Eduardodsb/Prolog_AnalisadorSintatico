%Artigos
artigoMas([o|S]-S).
artigoMas([os|S]-S).
artigoMas([um|S]-S).
artigoMas([uns|S]-S).

artigoFem([a|S]-S).
artigoFem([as|S]-S).
artigoFem([uma|S]-S).
artigoFem([umas|S]-S).

%Pronomes Pessoais
pronomePessoal([eu|S]-S).
pronomePessoal([tu|S]-S).
pronomePessoal([nós|S]-S).
pronomePessoal([vós|S]-S).

pronomePessoalMas([ele|S]-S).
pronomePessoalMas([eles|S]-S).

pronomePessoalFem([ela|S]-S).
pronomePessoalFem([elas|S]-S).

%Pronomes Demonstrativos
pronomeDemonstrativo([isto|S]-S).
pronomeDemonstrativo([isso|S]-S).
pronomeDemonstrativo([aquilo|S]-S).

pronomeDemonstrativoMas([este|S]-S).
pronomeDemonstrativoMas([esse|S]-S).
pronomeDemonstrativoMas([aquele|S]-S).

pronomeDemonstrativoFem([esta|S]-S).
pronomeDemonstrativoFem([essa|S]-S).
pronomeDemonstrativoFem([aquela|S]-S).

%pronomes possessivos
pronomePossessivoMas([meu|S]-S).
pronomePossessivoMas([meus|S]-S).
pronomePossessivoMas([teu|S]-S).
pronomePossessivoMas([teus|S]-S).
pronomePossessivoMas([seu|S]-S).
pronomePossessivoMas([seus|S]-S).
pronomePossessivoMas([nosso|S]-S).
pronomePossessivoMas([nossos|S]-S).
pronomePossessivoMas([vosso|S]-S).
pronomePossessivoMas([vossos|S]-S).

pronomePossessivoFem([minha|S]-S).
pronomePossessivoFem([minhas|S]-S).
pronomePossessivoFem([tua|S]-S).
pronomePossessivoFem([tuas|S]-S).
pronomePossessivoFem([sua|S]-S).
pronomePossessivoFem([suas|S]-S).
pronomePossessivoFem([nossa|S]-S).
pronomePossessivoFem([nossas|S]-S).
pronomePossessivoFem([vossa|S]-S).
pronomePossessivoFem([vossas|S]-S).

pronomeMas(S) :- pronomePessoalMas(S).
pronomeMas(S) :- pronomeDemonstrativoMas(S).
pronomeMas(S) :- pronomeDemonstrativo(S).
pronomeMas(S) :- pronomePossessivoMas(S).
pronomeMas(S) :- pronomePessoal(S).

pronomeFem(S) :- pronomePessoalFem(S).
pronomeFem(S) :- pronomeDemonstrativoFem(S).
pronomeFem(S) :- pronomeDemonstrativo(S).
pronomeFem(S) :- pronomePossessivoFem(S).
pronomeFem(S) :- pronomePessoal(S).

%adjetivos
adjetivoMas([frio|S]-S).
adjetivoMas([bonito|S]-S).
adjetivoMas([feio|S]-S).
adjetivoMas([pequeno|S]-S).
adjetivoMas([fraco|S]-S).
adjetivoMas([quente|S]-S).
adjetivoMas([grande|S]-S).
adjetivoMas([forte|S]-S).


adjetivoFem([fria|S]-S).
adjetivoFem([bonita|S]-S).
adjetivoFem([feia|S]-S).
adjetivoFem([pequena|S]-S).
adjetivoFem([fraca|S]-S).
adjetivoFem([quente|S]-S).
adjetivoFem([grande|S]-S).
adjetivoFem([forte|S]-S).


%verbos (Presente)
verbo([estou|S]-S).
verbo([estás|S]-S).
verbo([está|S]-S).
verbo([estamos|S]-S).
verbo([estais|S]-S).
verbo([estão|S]-S).
verbo([sou|S]-S).
verbo([é|S]-S).

%Substantivo
substantivoMas([gato|S]-S).
substantivoMas([cachorro|S]-S).
substantivoMas([caderno|S]-S).
substantivoMas([menino|S]-S).
substantivoMas([pão|S]-S).


substantivoFem([gata|S]-S).
substantivoFem([cachorra|S]-S).
substantivoFem([cadeira|S]-S).
substantivoFem([menina|S]-S).

% Código responável pelo Analisador sintático (Verificar se é uma sentença é válida).
sentenca(S) :- sujeitoMas(S-S1), predicadoMas(S1-[]).
sentenca(S) :- sujeitoFem(S-S1), predicadoFem(S1-[]).

sujeitoMas(S-S0) :- artigoMas(S-S1), sujeito2Mas(S1-S0).
sujeitoMas(S) :- pronomeMas(S).
sujeitoMas(S) :- sujeito2Mas(S).
sujeito2Mas(S-S0) :- adjetivoMas(S-S1), sujeito2Mas(S1-S0).
sujeito2Mas(S-S0) :- pronomeMas(S-S1), sujeito2Mas(S1-S0).
sujeito2Mas(S) :- substantivoMas(S).

predicadoMas(S) :- verbo(S).
predicadoMas(S-S0) :- verbo(S-S1), sujeitoMas(S1-S0).
predicadoMas(S-S0) :- verbo(S-S1), adjetivoMas(S1-S0).

sujeitoFem(S-S0) :- artigoFem(S-S1), sujeito2Fem(S1-S0).
sujeitoFem(S) :- pronomeFem(S).
sujeitoFem(S) :- sujeito2Fem(S).
sujeito2Fem(S-S0) :- pronomeFem(S-S1), sujeito2Fem(S1-S0).
sujeito2Fem(S-S0) :- adjetivoFem(S-S1), sujeito2Fem(S1-S0).
sujeito2Fem(S) :- substantivoFem(S).

predicadoFem(S) :- verbo(S).
predicadoFem(S-S0) :- verbo(S-S1), sujeitoFem(S1-S0).
predicadoFem(S-S0) :- verbo(S-S1), adjetivoFem(S1-S0).

%Código responável por traduzir da língua do P para português.

%consoante([b|Xs]).
%consoante([c|Xs]).
%consoante([d|Xs]).
%consoante([f|Xs]).
%consoante([g|Xs]).
%consoante([h|Xs]).
%consoante([j|Xs]).
%consoante([k|Xs]).
%consoante([l|Xs]).
%consoante([m|Xs]).
%consoante([n|Xs]).
%consoante([p|Xs]).
%consoante([q|Xs]).
%consoante([r|Xs]).
%consoante([s|Xs]).
%consoante([t|Xs]).
%consoante([v|Xs]).
%consoante([x|Xs]).
%consoante([y|Xs]).
%consoante([z|Xs]).

concat([],Ys,Ys).
concat([X|Xs],Ys,[X|Zs]) :- concat(Xs,Ys,Zs).

traduzParaP([],[]).
traduzParaP([X|Xs],[Y|Ys]) :- traduzParaP2(X,K), atomics_to_string(K, A), atom_string(Y, A), traduzParaP(Xs,Ys).

traduzParaP2([],[]).
traduzParaP2([X|Xs],[Y|Ys]) :- string_chars(X,Z), incluirP(Z,K), atomics_to_string(K, A), atom_string(Y, A), traduzParaP2(Xs,Ys).

incluirP([],[]).
incluirP([a|Xs],Ys) :- concat([p,a],Xs,Zs), concat([a],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([â|Xs],Ys) :- concat([p,â],Xs,Zs), concat([â],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([á|Xs],Ys) :- concat([p,á],Xs,Zs), concat([á],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([ã|Xs],Ys) :- concat([p,ã],Xs,Zs), concat([ã],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([e|Xs],Ys) :- concat([p,e],Xs,Zs), concat([e],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([ê|Xs],Ys) :- concat([p,ê],Xs,Zs), concat([ê],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([é|Xs],Ys) :- concat([p,é],Xs,Zs), concat([é],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([i|Xs],Ys) :- concat([p,i],Xs,Zs), concat([i],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([í|Xs],Ys) :- concat([p,í],Xs,Zs), concat([í],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([o|Xs],Ys) :- concat([p,o],Xs,Zs), concat([o],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([õ|Xs],Ys) :- concat([p,õ],Xs,Zs), concat([õ],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([ô|Xs],Ys) :- concat([p,ô],Xs,Zs), concat([ô],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([ó|Xs],Ys) :- concat([p,ó],Xs,Zs), concat([ó],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([u|Xs],Ys) :- concat([p,u],Xs,Zs), concat([u],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([ú|Xs],Ys) :- concat([p,ú],Xs,Zs), concat([ú],Xs,Ks), concat(Ks,Zs,Ys).
incluirP([X|Xs],Ys) :- concat([p],Xs,Zs), concat([X],Xs,Ks), concat(Ks,Zs,Ys).


% incluirP([X|Xs],Ys) :- not(consoante(Xs)), concat([p],Xs,Zs),
% concat([X],Xs,Ks), concat(Ks,Zs,Ys).
%incluirP([X|Xs],Ys) :- incluirP(Xs,Zs), concat([X],Zs,Ys).



%Código responável por traduzir de português para a língua do P.

membro(X,[X|_]).
membro(X,[_|Zs]):- membro(X,Zs).

traduzParaPort([],[]).
traduzParaPort([X|Xs],[Y|Ys]) :- traduzParaPort2(X,K), atomics_to_string(K, A), atom_string(Y, A), traduzParaPort(Xs,Ys).

traduzParaPort2([],[]).
traduzParaPort2([X|Xs],[Y|Ys]) :- string_chars(X,Z), tirarP(Z,K), atomics_to_string(K, A), atom_string(Y, A), traduzParaPort2(Xs,Ys).

tirarP([p|Xs],[p|Ys]) :- membro(p,Xs), tirarP(Xs,Ys).
tirarP([p|_],[]).
tirarP([X|Xs],[X|Ys]) :- tirarP(Xs,Ys).

%Main

concatena([],[]).
concatena([X|Xs],[P|Zs]) :- atomics_to_string(X, R), atom_string(P, R), concatena(Xs,Zs) .

converteParaP(Xs,Ys) :- concatena(Xs,Zs), sentenca(Zs), traduzParaP(Xs,Ys).
converteParaPort(Xs,Ys) :- traduzParaPort(Xs,Ys), sentenca(Ys).








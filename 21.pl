car(fiat, azul, joao).
car(fiat, verde, maria).
car(gol, prata, jose).
car(onyx, preto, joao).
car(up, preto, antonio).
car(onyx, prata, maria).
car(onyx, azul, telma).

pessoa(joao, professor, casado).
pessoa(maria, dentista, casado).
pessoa(jose, fazendeiro, solteiro).
pessoa(antonio, professor, casado).
pessoa(telma, policial, solteiro).
pessoa(lidia, fiscal, solteiro).

modelo(fiat, azul).
modelo(fiat, verde).
modelo(fiat, prata).
modelo(gol, preto).
modelo(gol, prata).
modelo(onyx, preto).
modelo(onyx, prata).
modelo(onyx, azul).
modelo(up, preto).
modelo(up, vermelho).

% supondo que Pessoa seja um nome
possui_azul(Pessoa) :- car(_, azul, Pessoa).

todas_cores(Pessoa, Cores) :- 
    findall(Cor, car(_, Cor, Pessoa), Cores).

nao_tem_carros(Pessoa) :- 
    pessoa(Pessoa, _, _),
    not(car(_, _, Pessoa)).

solteiro_com_carro(Pessoa) :- 
    pessoa(Pessoa, _, solteiro),
    car(_, _, Pessoa).
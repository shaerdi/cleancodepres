i = i+1; % erh�ht i um 1


% Hier sollte der Code ein wenig gek�rzt werden, evtl. mit ein paar
% Umbenennungen. Schliesslich hat das Simon in seiner Praesentation
% vorgef�hrt (TODO: Pr�sentation lesen)


x = getAllXValues();
y = calculateY(x);
% y = correctY(y);
plot(x,y);


% Addiert alle Werte von x, die kleiner als der Threshold 3 sind zu z, 
% der Rest wird auf Null gesetzt
z(x<2) = z(x<2)+ x(x<2);
x(x<2) = 0;
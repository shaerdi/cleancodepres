% Geschwindigkeitskritischer Teil, Vektorisierte Schlaufe
% Berechnet das Kreuzprodukt aller Vektoren (x,y,z) in den
% Matrizen X,Y,Z mit dem Vektor (1,2,3)
Koords(:,:,1) = X;Koords(:,:,2) = Y;Koords(:,:,3) = Z;
vektor = [1,2,3]; vektor = reshape(vektor,1,1,3); 
VektorMatrix = repmat(vektor,size(Koords,1),size(Koords,2),1);
Kreuzprodukt = cross(Koords,VektorMatrix,3);


%  Algorithmus nach R. P. Brent in "Algorithms for
%  Minimization Without Derivatives", Prentice-Hall, 1973.
function nullstelle = findeNullstelle(funktion,startwert)
...
end


function Sens = sens(x, Args)
Twi = Args(1);
Tii = Args(2);
A = Args(3);
B = Args(4);
C = Args(5);

Two = x(1);
Tio = x(2);

R = (Tii - Tio)./(Two - Twi);
S = (Two - Twi)./(Tii - Twi);

F = (sqrt(R^2 + 1) .* log( (1-S)./(1-R.*S) )) ./ ((R-1).*log( (2 - S.*(R + 1 - sqrt(R.^2 +1))) ./ (2 - S.*(R + 1 + sqrt(R.^2 +1)))  ));
DTlm = ((Tii-Two) -(Tio - Twi) ) ./ (log((Tii-Two)./(Tio - Twi)));

Sens(1) = A.*(Two - Twi) - B.*(Tii - Tio);
Sens(2) = C.*F.*DTlm - B.*(Tii - Tio);


end
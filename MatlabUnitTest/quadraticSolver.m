function roots = quadraticSolver(a, b, c)
% quadraticSolver returns solutions to the 
% quadratic equation a*x^2 + b*x + c = 0.

if ~isa(a,'numeric') || ~isa(b,'numeric') || ~isa(c,'numeric')
    error('quadraticSolver:InputMustBeNumeric', ...
        'Coefficients must be numeric.');
end

if ~(length(a)==length(b)) || ~(length(b)==length(c))
     error('quadraticSolver:InputMustHaveSameLength', ...
        'Coefficients must be numeric.');
end

roots = zeros(length(a),2);

roots(:,1) = (-b + sqrt(b.^2 - 4*a.*c)) ./ (2*a);
roots(:,2) = (-b - sqrt(b.^2 - 4*a.*c)) ./ (2*a);

end

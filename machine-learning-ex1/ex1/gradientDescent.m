function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
t0 = theta(1);
t1 = theta(2);
for iter = 1:num_iters
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    % θ1:=θ1−αd/dθ1(J(θ1))
    t0_s = 0;
    t1_s = 0;
    for i = 1:m
      xi = X(i,2);
      yi = y(i);
    
      h = hypothesis(xi,t0,t1) - yi;
      
      t0_s += h;
      t1_s += h*xi;
    end
    
    t0_s /= m;
    t1_s /= m;
    
    t0 = t0 - alpha*t0_s;
    t1 = t1 - alpha*t1_s;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end
  theta = [t0 t1]';
end

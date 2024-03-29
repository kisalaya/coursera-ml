function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
  
h = sigmoid(X*theta);

J = -1*((y'*log(h)) + ((1-y)'*log(1-h)))/m;

s = 0;

for i = 2:size(theta,1)

  s+=theta(i,1)*theta(i,1)

end

s = s*lambda/(2*m);

J+=s;

% =============================================================

for j = 1:size(theta,1)
  s = 0;
  for i = 1:m
    s += (sigmoid(X(i,:)*theta) - y(i,:))*X(i,j);
  end
  grad(j,1) = (s/m);
  if j ~=1
    grad(j,1) += lambda*theta(j,1)/m;

  end
end

end

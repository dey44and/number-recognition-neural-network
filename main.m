a = -0.12;
b = 0.12;

Theta1 = (b-a).*rand(25, 785) + a;
Theta2 = (b-a).*rand(10, 26) + a;
lambda = 3;
learn_rate = 0.3;

J_table = zeros(1000, 2);

for step = 1:2000
    [J, Theta1_grad, Theta2_grad] = cost_function(X_train, y_train, Theta1, Theta2, lambda);
    J_table(step, 1) = step;
    J_table(step, 2) = J;

    Theta1 = Theta1 - learn_rate * Theta1_grad;
    Theta2 = Theta2 - learn_rate * Theta2_grad;

    fprintf("Pasul %g cu scor: %g\n", step, J);
end

plot(J_table(:,1), J_table(:,2));
xlabel("Number of iteration");
ylabel("The value of Cost Function");
title("Evolution of Cost Function");
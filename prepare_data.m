X = readmatrix("mnist_train.csv");

X_train = X(1:10000,2:785);
y_aux = X(1:10000,1);

for i = 1:10000
    if y_aux(i) == 0
        y_aux(i) = 10;
    end
end

X_train = zscore(X_train, 1, 2);
y_train = zeros(10, 10000);
for i = 1:10000
    y_train(y_aux(i), i) = 1;
end
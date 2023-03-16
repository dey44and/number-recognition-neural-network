function score = test_data(X_train, y_train, Theta1, Theta2)
    m = size(X_train, 1);

    X = [ones(m,1) X_train];
    score = 0;
    for t = 1:m
        a1 = X(t,:); % X already have a bias Line 44 (1*401)
        a1 = a1'; % (401*1)
	    z2 = Theta1 * a1; % (25*401)*(401*1)
	    a2 = sigmoid(z2); % (25*1)
        
        a2 = [1 ; a2]; % adding a bias (26*1)
	    z3 = Theta2 * a2; % (10*26)*(26*1)
	    a3 = sigmoid(z3); % final activation layer a3 == h(theta) (10*1)
        
        
            [val, idx1] = max(a3);
            [val, idx2] = max(y_train(:,t));
            if idx1 == idx2
                score = score + 1;
            end
        %fprintf("%g %g\n", idx1, idx2);
    end
    score = score / m;
end
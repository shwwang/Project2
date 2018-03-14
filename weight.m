function [w] = weight(num_layer,num_neu) 
% num_neu is a 1*(num_layer-2) vector; it stores the number
% of neurons in each hidden layer has.

w = cell(1,num_layer-1);
% w is an array, and each entry is a matrix of weights

w{1} = 0.0001*rand([784,num_neu(1)]);
% weights from input layer to hidden layer 1

for i = 2: (num_layer-2)
    w{i} = 0.0001*rand([num_neu(i-1),num_neu(i)]);
    % weights from hidden layer i-1 to hidden layer i
end

w{num_layer-1} = 0.0001*rand([num_neu(num_layer-2),10]);
% weights from the last hidden layer to output layer

end

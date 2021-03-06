function [new_weights] = TrainNetwork(Input, Targets, Weights, nit)
% targets = arrays of vectors of each hidden layer, given the number of layers and 
%           number of neuron in each layer by weights.
% nit = given number in [0.01, 0.1]

num_Layers = length(Weights);
% Weights = arrays of weights generated by the function Weights(num_layer,num_neuron)
% The number of layers is determined by 

[m,n] = size(Input);
% input = m*784 matrix, and each row is a hadritten digit.

%------ forward -----%
for i=1:m
    in = Inputs{i};
    % pull out one row from the input matrix as the input for each step
    
    out = cell(1, num_Layers);
    % store output of each layer in an array
    
    for j=1:num_Layers
        [~,b] = size(Weights{j})
        NET =  in * Weights{j};                        
        for k = 1:b
            O{j}(k) = 1/(1+exp(-NET(k)));
        end 
    end
    % reused the code from MultiNet
    
    
%----- reverse -----%

    % output layer vs. target layer
    out_layer = out{num_Layers};
    err = abs(out_layer - Targets{i});  
    del = out_layer * (1 - out_layer) * err;
    WeightUpdate = nit * out{num_Layers-1}' * del;
    Weights{num_Layers} = Weights{num_Layers} - WeightUpdate;
    
    % hidden layer vs. target layer
    for j=num_Layers-1:-1:2
    % -1：reverse order of for-loop
        del = (del * Weights{j+1}') * out{j} * (1 - out{j});
        WeightUpdate = nit * out{j-1}' * del;
        Weights{j} = Weights{j} + WeightUpdate;
        % update changes of weights to the array
    end
end

new_weights = Weights;


end

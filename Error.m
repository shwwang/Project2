function [Max_error] = Error(Input, Targets, Weights)

num_Layers = length(Weights);


[m,~] = size(Input);

Max_error = 0;

for i=1:m
    error_i = 0;
    
    in = Input{i};
   
    out = cell(1, num_Layers);
   
    for j=1:num_Layers
        [~,b] = size(Weights{j});
        NET =  in * Weights{j};                        
        for k = 1:b
            out{j}(k) = 1/(1+exp(-NET(k)));
        end 
    end

end

%   find the weight matrix for the last hidden layer and output layer
    out_layer = out{num_Layers};
    err = abs(out_layer - Targets{num_Layers});  
    del = out_layer * (1 - out_layer) * err;
    WeightUpdate = nit * out{num_Layers-1}' * del;
    Weights{num_Layers} = Weights{num_Layers} - WeightUpdate;
    
%   find the ideal layer of the output layer with the adjusted weight
%   matrix above.
    NET_ideal = out{num_Layers-1} * Weights{num_Layers};
    out_ideal = zeros(1,10);
    
    for k = 1:10
        out_ideal(k) = 1/(1+exp(-NET_ideal(k)));
    end
    error_i = max(abs(out_ideal - Targets{num_Layers}));
    
    if error_i>Max_error
        Max_error = error_i;
        %store the largest error of the test
    end

end

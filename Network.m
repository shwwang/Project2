function Upweights = Network(Input, Targets, Weights, nit)

numLayers = length(Weights);

for i=1:length(Input)
    in = Inputs{i};
    OUT = cell(1, numLayers);
    
    % Forward pass 
    
    for j=1:numLayers
        NET =  in * Weights{j};                        
        in = 1./(1 + exp(-NET));  
        OUT{j} = in;
    end
    
    % Reverse pass
    
    % for last layer
    output = OUT{numLayers};
    error = abs(output - Targets{i});  
    delta = output * (1 - output) * error;
    WeightUpdate = nit * OUT{numLayers-1}' * delta;
    Weights{numLayers} = Weights{numLayers} - WeightUpdate;
    
    % for hidden layers
    for j=numLayers-1:-1:2
        delta = (delta * Weights{j+1}') * OUT{j} * (1 - OUT{j});
        WeightUpdate = nit * OUT{j-1}' * delta;
        Weights{j} = Weights{j} - WeightUpdate;
    end
    
end
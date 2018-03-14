% Part 4

function [Output] = numHidden(Input,weights)

% Input is a vector
% weights are a array

Output = Input;
% Get the input as a vector

for i = 1:length(weights)
    
    NET = Output * weights{i};
    
    Output = 1/(1+exp(-NET));
    Output = transpose(Output);
    
    
end
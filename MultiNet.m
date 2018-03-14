% Part 4

function [O] = MultiNet(Input,weights)

% Input is a vector
% weights are a array

inp = double(Input);
% Get the initial input

for i = 1:length(weights)
    
    [~,b] = size(weights{i});
    
    W = weights{i};
    
    Net = inp * W;
    %the size of net is 1*b
    
    O = zeros(1,b);
    
    for j = 1:b
        O(j) = 1/(1+exp(-Net(j)));
        %size of output is 1*b
    end
    
    inp = O;
    %output in step i is the input in step i+1
    
end
    
end

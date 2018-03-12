function [OUT] = Neuron (inputs, weights)
NET = inputs*weights';
% NET is the value of the dot product of inputs and weights
OUT = 1/(1+exp(-NET));
% Use 
end

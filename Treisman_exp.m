function [] = Treisman_exp(n, cond, target)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here



%% input check
condition_names = {'c', 'dsym', 'dcol'};
input_check = zeros(1,3);

% checks whether the n input is okay
if ~ismember(n, [8, 24, 40, 56])
    input_check(1) = 1;
    fprintf("The number of objects must be 8, 24, 40 or 56. \n")
end

% checks whether the target input is okay
if ~ismember(target, [0, 1])
    input_check(2) = 1;
    fprintf("The target input must be 1 or 0. \n")
end

% checks whether the condition input is okay
if ~strcmp(cond, condition_names)
    input_check(3) = 1;
    fprintf("%s is an invalid condition name. \n", cond)
end

% returns an error if any of the inputs are inappropirate
if sum(input_check) > 0
    error("Please use valid inputs.")
end

%% This function uses a "target matrix" and an "distribition matrix" to work out
% the ratios of symbols and their colours. In these two matrices, the coordinates correspond to:
% 1,1 == red x
% 1,2 == red 0
% 2,1 == blue x
% 2,2 == blue 0

% preallocating the target and distribution matrices
target_mat = zeros(2,2);
distribution = zeros(2,2);

% This loop randomly selects the target type (col/sym)
if target == 1
    row = randi([1, 2]);
    col = randi([1, 2]);
    target_mat(row, col) = 1;
end

%% this loop selects the distribution matrix based on the condition input
if strcmp(cond, 'c')
    % Assigning the conjunctive distribution
    distribution = [target, (n/4); (n/2 - target), (n/4)];
elseif strcmp(cond, 'dsym')
    % Assigning the disjunctive symbol distribution
    distribution = [target, (n/2 - target); 0, (n/2)];
else
    % Assigning the disjunctive colour distribution
    distribution = [target, 0; (n/2 - target), (n/2)];
end

% This uses the target matrix to flip the distribution matrix, according to the target type.
% This ensures that the ratio of colours is equal.
if target_mat(1,2) == 1
    distribution = fliplr(distribution);
elseif target_mat(2,1) == 1
    distribution = flipud(distribution);
elseif target_mat(2,2) == 1
    distribution = fliplr(distribution);
    distribution = flipud(distribution);
    % else, nothing happens bceuase the distribution matrix doesn't need to
    % change
end

%% This section plots the objects
%initializing a figure
f = figure();

% creating a matrix of locations
loc = rand(n, 2);

% plotting the objects
red_x = 0;
blue_x = 0;
red_O = 0;
blue_O = 0;

while red_x < distribution(1,1)
    put_symbol_inFigure(loc(1,:), 'X', 'r')
    red_x = red_x + 1;
    if size(loc, 1) > 1
        loc = loc(2:length(loc), :);
    end
end

while red_O < distribution(1,2)
    put_symbol_inFigure(loc(1,:), 'O', 'r')
    red_O = red_O + 1;
    if size(loc, 1) > 1
        loc = loc(2:length(loc), :);
    end
end

while blue_x < distribution(2,1)
    put_symbol_inFigure(loc(1,:), 'X', 'b')
    blue_x = blue_x + 1;
    if size(loc, 1) > 1
        loc = loc(2:length(loc), :);
    end
end

while blue_O < distribution(2,2)
    put_symbol_inFigure(loc(1,:), 'O', 'b')
    blue_O = blue_O + 1;
    if size(loc, 1) > 1
        loc = loc(2:length(loc), :);
    end
end
end


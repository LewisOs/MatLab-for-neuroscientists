function [reaction_time, correct] = do_experiment(n, cond, target)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% initialzing variables
reaction_time = [];
correct = [];
response = [];

% starting the timer
tic

% calling the Triesman function to generate an image
Triesman_exp(n, cond, target)

% getting the participant's response, this loop ensures they use 'g' or 'h'
pause

% stopping the timer
reaction_time = toc;
response = get(gcf, 'CurrentCharacter');

% checking is the response is correct
if (strcmpi(response, 'g'  && target == 1)) || (strcmpi(response, 'h'  && target == 0))
    correct = 1;
else
    correct = 0;
end

end


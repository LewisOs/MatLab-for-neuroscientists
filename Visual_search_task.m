%% Main experimental script

%% Initialising/preallocating variables

% Struct of vectors to store the participant's responses - called 'ptpt'
ptpt.num = NaN(400,1)
ptpt.gender = NaN(400,1)
ptpt.trial = NaN(400,1)
ptpt.rt = NaN(400,1)
ptpt.correct = NaN(400,1)
ptpt.set_size = NaN(400,1)
ptpt.condition = NaN(400,1)
ptpt.target = NaN(400,1)
ptpt.response = NaN(400,1)


% Counters
% No. of trials 
num_trials = 1

% Hit trials per condition:
% Rows correspond to set size (8, 24, 40, 56)
% Col correspond to cond (c, dcol, dsym)
Hit_counters = zeros(4,3)
%% Getting participant information

% getting participant number - pop up with text box 
% input check - must be an int
% saving to ptpt_struct
ptpt_num = input("Please enter the participant number given to you by the researchers: \n")
if ptpt_num 
ptpt.num(1,1) = 

% getting participant gender - pop up with push buttons
% saving to ptpt_struct

%% Giving instructions

% explaing what the experiment involves
% explain how to do the experiment

%% Running practice trials

% show the ptpt examples of the conditions 

% generate trial block
% run a block of 10 practice trials - do_exp
% for column in trial block, use col values to call do_exp
% each trial, tell the ptpt if they're correct or not
% store whether correct in counter

% after 10 trials, check whether 80% are correct
% if not, ask the ptpts if they want to see the instuctions
% & repeat loop
% if 80% correct move onto next section


%% Main experimental loop

% generate a trial block

% for loop to run 60 trials:
% for column in trial block, use col values to call do_exp
%

% give the ptpt a break
% check how many trial blocks have been completed
% if < 5 repeat for loop above
% if > 5 check whether hit trial counters are full
% if counters are full, end experiment
% if counters aren't full go to loop below

% this for loop is identical to the main one above, with one exception
% this checks that the counters are full after every trial. If they are, it
% ends the experiment. This saves the ptpt. from doing trials unecessarily.

%% End of experiment

% save the ptpt_struct as an .m file

% Explain the purpose of the experiment & thank the subject for their time


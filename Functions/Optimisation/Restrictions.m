function [egn17,max,min] = Restrictions(egn17)
%RESTRICTIONS Summary of this function goes here
%   Detailed explanation goes here
    [egn17,max.front,min.front]=front(egn17);
    [egn17,max.rear,min.rear]=rear(egn17);
end
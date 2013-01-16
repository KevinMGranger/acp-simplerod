function [ temp_array ]  =  simple_rod ( num, TL, TR )
%
%DESCRIPTION
%    Determine the temperature as a function of position for a heated rod.
%
%ARGUMENTS
%
%    num                        is the number of pieces into which
%                                  the rod is divided for numerical
%                                  calculations
%
%    TL                         is the temperature of the left end
%                                  (units are Kelvin)
%
%    TR                         is the temperature of the right end
%                                  (units are Kelvin)
%
%RETURNS
%
%    temp_array                 is a 1-by-num maxtrix of 
%                                  temperatures, one per piece of rod
%                                  (units are Kelvin)
%AUTHOR
%    Kevin Granger <kmg2728@rit.edu>
%    2013-01-08

%{
Additional Documentation:

MATH

    This program attempts to solve the partial differential equation
    d^2 T / dx^2 = 0 iteratively. It does this by breaking the length of X
    into a given amount of small pieces, and averaging the value of each
    piece between the pieces that surround it. The reasoning behind the
    average was determined by expressing the "second difference" of each of
    the temperature values in an equation, and rearranging to determine
    what the value of the current piece is when the second difference is 0.

    In other words, for a piece i compared to the piece on the left (L) and
    a piece on the right (R), the second difference between the values
    should be zero:

        (TR - Ti) - (Ti - TL) = 0

    or when rearranged:

        Ti = (TR + TL) / 2

    hence the average.

    New values are computed until the maximum fractional change for any
    piece is less than the determined convergence factor, which is 0.01
    divided by the number of pieces the rod is broken into.


VARIABLE NAMING
    
    See the comments near where each variable is declared / invoked the
    first time.

%}




% Check starting values :
if TL < 0 || TR < 0
    error('Temperatures are given in Kelvin, and as such must be above absolute zero.')
elseif num < 1 || rem(num,1) ~= 0
    error('You must give a positive, nonzero, integer number of pieces to break the rod into.')
end



A = zeros(num,num+2);
for i=2:num+1
    A(i-1,[i-1 i+1]) = 1;
    A(i-1,i) = -2;
end

B = [TL zeros(1,num-2) TR]';

temp_array = A\B;

temp_array = temp_array(2:num+1);
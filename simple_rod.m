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

%}



PSEUDOCODE:

check starting values
	tl, tr > 0
	num > 0

old_array: tl, num, tr

do
	new_array = old_array
	for array at 2 to array at end-1

		DO SOME MATH FOR EACH PIECE, EACH STEP
		%apparently not using that method?
		%check first difference
		%check second difference
	end

	frac = abs(new - old) / old

	loops++ (for tracking)
while frac change is > 10^-2

return temp_array


% vim:tw=76 fdm=marker fmr=%{,%}

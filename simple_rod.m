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

    VARIABLE NAMING

%}




% Check starting values :
if TL < 0 || TR < 0
    error('Temperatures are given in Kelvin, and as such must be above absolute zero.')
elseif num < 1 || rem(num,1) ~= 0
    error('You must give a positive, nonzero, integer number of pieces to break the rod into.')
end
old_array = [ TL (ones(1,num) * mean([TL TR])) TR];
temp_array = old_array;
frac = 1;
loops = 0;

while frac > 10^-2
    
    for i=2:num+1
		temp_array(i) = (old_array(i-1) + old_array(i+1)) / 2;
    end
	frac = max(abs(temp_array - old_array) ./ old_array);

	loops = loops + 1;
    
    old_array = temp_array;
end

temp_array = temp_array(2:num+1);



% vim:tw=76 fdm=marker fmr=%{,%}

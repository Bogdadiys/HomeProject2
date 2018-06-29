-module(bs01).
-export([first_word/1]).
-author("Kalyta Bogdan").

first_word(Words)->
	first_w(Words,<<>>).
 
first_w(<<" ",_R/binary>>, Acc)->
	Acc;
first_w(<<L,R/binary>>, Acc)->
	first_w(R, <<Acc/binary, L>>);
first_w(<<>>, Acc)->
	Acc.

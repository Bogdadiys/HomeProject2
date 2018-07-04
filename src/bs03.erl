-module(bs03).
-export([split/2]).
-author("Kalyta Bogdan").

split(BinText,Split)->
	spl(BinText,<< <<X>> || X<-Split>>,<<>>).

spl(BinText,BinSplit,Word)->
	SizeSplit = byte_size(BinSplit),
	case BinText of
		<<BinSplit:SizeSplit/binary, Text/binary>> ->
			[Word|spl(Text,BinSplit,<<>>)];
		<<L,Text/binary>>->
			spl(Text,BinSplit,<<Word/binary, L>>);
		<<>> when Word == <<>> ->
			[];
		<<>> ->
			[Word];
		_ -> undefined
	end.

%split(<<>>,_)->
%	[];
%split(BinText,Split)->
%	BinSplit = << <<X>> || X<-Split>>,
%	case binary:match(BinText,BinSplit,[]) of
%		{Position,LenghtSplit} -> 
%			[binary:part(BinText, {0,Position})|split(binary:part(BinText, {Position+LenghtSplit,byte_size(BinText)-(Position+LenghtSplit)}),Split)];
%		nomatch -> 
%			[BinText]
%	end.

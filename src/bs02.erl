-module(bs02).
-export([words/1]).
-author("Kalyta Bogdan").

words(Text)->
	words(<<>>,Text).

words(Word,<<" ", Text/binary>>)->
	[Word|words(<<>>,Text)];
words(Word,<<L,Text/binary>>)->
	words(<<Word/binary, L>>,Text);
words(Word,<<>>)->
	[Word].





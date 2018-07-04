-module(bs01_test).
%-compile(export_all).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-author("Bogdan Kalyta").
first_word_test()->[
?_assertEqual(bs01:first_word(<<"qwerty qwer">>),<<"qwerty">>),
?_assertEqual(bs01:first_word(<<>>),<<>>),

?_assertError(bad_argument,bs01:first_word(1))].
-endif.

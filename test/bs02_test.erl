-module(bs02_test).
%-compile(export_all).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-author("Bogdan Kalyta").
words_test()->[
?_assertEqual(bs02:words(<<"qwerty qwer">>),[<<"qwerty">>,<<"qwer">>]),
?_assertEqual(bs02:words(<<>>),<<>>),

?_assertError(bad_argument,bs02:words(1))].
-endif.

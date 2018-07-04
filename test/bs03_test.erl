-module(bs03_test).
%-compile(export_all).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-author("Bogdan Kalyta").
split_test()->[
?_assertEqual(bs03:split(<<"qwerty-:-qwer">>,"split"),[<<"qwerty">>,<<"qwer">>]),
?_assertEqual(bs03:split(<<>>,""),<<>>),

?_assertError(bad_argument,bs03:split(1,0))].
-endif.

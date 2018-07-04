-module(bs04_test).
%-compile(export_all).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-author("Bogdan Kalyta").
decode_xml_test()->[
?_assertEqual(bs04:decode_xml(<<"<start><item>qwerty</item><item>qwer</item></start>">>),<<"{start, [], [
{item, [], [qwerty ]}, 
{item, [], [qwer ]}
 ]}">>),
?_assertEqual(bs04:decode_xml(<<>>),<<>>),

?_assertError(bad_argument,bs04:decode_xml(1))].
-endif.

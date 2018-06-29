-module(bs04).
-export([decode_xml/1]).
-author("Kalyta Bogdan").

decode_xml(BinXml)->
	TagSize = tagSize(BinXml,0),
	ItemSize = itemSize(BinXml,0,-1),
case BinXml of
		<<"<",Tag:TagSize/binary,">", Item:ItemSize/binary, "</",Tag:TagSize/binary,">">> ->
			io:format("~n{"),
			io:format(Tag),
			io:format(", [], ["),
			decode_xml(Item),
			io:format(" ]}~n");
		<<"<",Tag:TagSize/binary,">", Item:ItemSize/binary, "</",Tag:TagSize/binary,">", R/binary>> ->
			io:format("~n{"),
			io:format(Tag),
			io:format(", [], ["),
			decode_xml(Item),
			io:format(" ]}, "),			
			decode_xml(R);

		_ -> 
			io:format(BinXml)	
	end.

tagSize(<<">",_Xml/binary>>,Size)->
	Size;
tagSize(<<>>,_Size)->
	0;
tagSize(<<"<",Xml/binary>>,_Size)->
	tagSize(Xml,0);
tagSize(<<_,Xml/binary>>,Size)->
	tagSize(Xml,Size+1).

itemSize(<<"</",_Xml/binary>>,Size,0)->
	Size;
itemSize(<<>>,Size,_)->
	Size;
itemSize(<<"<",Xml/binary>>,_Size,-1)->
	itemSize(Xml,0,-1);
itemSize(<<">",Xml/binary>>,_Size,-1)->
	itemSize(Xml,0,0);
itemSize(<<"</",Xml/binary>>,Size,Quotes)->
	itemSize(Xml,Size+2,Quotes-1);
itemSize(<<"<",Xml/binary>>,Size,Quotes)->
	itemSize(Xml,Size+1,Quotes+1);
itemSize(<<_,Xml/binary>>,Size,Quotes)->
	itemSize(Xml,Size+1,Quotes).

/*
Name: radio
Author: IndeedPete
Purpose: Simulate radio or direct conversations between units. Calculates delay based on input length.
----------
Parameters:
_speaker - OBJECT: Unit that should say the _sentence. - player
_sentence - STRING: Text that the _speaker should say. - "Hello world!"
_wichChat - STRING (OPTIONAL): Which way of communication should be used. Available chats: "SIDE", "GROUP", "VEH", "CUT" or "DIRECT" - "DIRECT" - DEFAULT: "SIDE"
_add - NUMBER (OPTIONAL): Addition in seconds to the calculated delay. Can be negative. - 5 - DEFAULT: 0
_len - NUMBER (OPTIONAL): Fixed delay. - 20 - DEFAULT: ((count (toArray _sentence)) * _x) <- calculation to determine delay
*/

private ["_speaker", "_sentence", "_add", "_len"];
_x = 0.09;

_speaker = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_sentence = [_this, 1, "", [""]] call BIS_fnc_param;
_wichChat = toUpper([_this, 2, "SIDE", [""]] call BIS_fnc_param);
_add = [_this, 3, 0, [0]] call BIS_fnc_param;
_len = [_this, 4, ((count (toArray _sentence)) * _x), [0]] call BIS_fnc_param;
_len = _len + _add;

_speaker setRandomLip true;
switch (_wichChat) do {
	case "SIDE": {_speaker sideChat _sentence};
	case "GROUP": {_speaker groupChat _sentence};
	case "VEH": {_speaker vehicleChat _sentence};
	case "CUT": {titleText [format ["%1", name _speaker] + ": """ + _sentence + """","PLAIN DOWN"]};
	case "DIRECT": {
		_groupID = groupID (group _speaker);
		_speaker setGroupID [name _speaker];
		_speaker commandChat _sentence;
		(group _speaker) setGroupID [_groupID];
	};
	case "GLOBAL": {_speaker globalChat _sentence};
	default {hint format ["%1 not recognized!", _wichChat]};
};

sleep _len;
_speaker setRandomLip false;
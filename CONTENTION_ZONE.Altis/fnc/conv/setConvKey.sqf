/*
Name: setConvKey
Author: IndeedPete
Purpose: Sets a key on one or more units defined in the config of a conversation.
----------
Parameters:
_participants - OBJECT OR ARRAY OF OBJECTS: Units to set the key on. - player
_key - STRING: The key to set. - "MyFirstConversation"
*/

private ["_participants", "_key"];
_participants = [_this, 0, ObjNull, [ObjNull, []]] call BIS_fnc_param;
_key = [_this, 1, "", [""]] call BIS_fnc_param;

if (typeName _participants == "OBJECT") then {_participants = [_participants]};

{
	_participant = _x;
	_keys = _participant getVariable ["IP_ConvKeys", []];
	if (!(_key in _keys)) then {
		_keys pushBack _key;
		_participant setVariable ["IP_ConvKeys", _keys, true];
	};
} forEach _participants;
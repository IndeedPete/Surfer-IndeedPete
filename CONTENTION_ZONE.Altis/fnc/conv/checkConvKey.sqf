/*
Name: checkConvKey
Author: IndeedPete
Purpose: Checks if a conv key is set on a unit.
----------
Parameters:
_participant - OBJECT: Unit to check the key on. - player
_key - STRING: The key to check. - "MyFirstConversation"
*/

private ["_participant", "_key", "_keys"];
_participant = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_key = [_this, 1, "", [""]] call BIS_fnc_param;

_keys = _participant getVariable ["IP_ConvKeys", []];
(_key in _keys)
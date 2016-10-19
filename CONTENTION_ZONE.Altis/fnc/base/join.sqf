/*
Name: join
Author: IndeedPete
Purpose: Adds join action to unit so player can pick NPCs to join his group.
----------
Parameters:
_unit - OBJECT: Unit to add the action on. - myLittleNPC
_isSwitchable - BOOLEAN (OPTIONAL): If _unit should be available for team switch after joining. - false - DEFAULT: true
_sentences - ARRAY of ARRAY of STRING (OPTIONAL): First array: sentences the caller (player) could say. Second array: sentences the joining unit could respond. - [["Follow me!"], ["Aye, aye, Sir!"]] - DEFAULT: [["Come with me!"], ["Yes, Sir!"]] 
----------
Requires: simpleSentence
*/

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_isSwitchable = [_this, 1, true, [true]] call BIS_fnc_param;
_sentences = [_this, 2, [["Come with me!"], ["Yes, Sir!"]], [[]]] call BIS_fnc_param;

_challenge = (_sentences select 0) call BIS_fnc_selectRandom;
_response = (_sentences select 1) call BIS_fnc_selectRandom;
_actionName = "'" + _challenge + "'";

_unit setVariable ["IP_JoinChallenge", _challenge];
_unit setVariable ["IP_JoinResponse", _response];

if (_isSwitchable) then {
	_unit addAction [_actionName, {
		_unit = _this select 0;
		_caller = _this select 1;
		_id = _this select 2;
		_unit removeAction _id;
		
		_challenge = _unit getVariable ["IP_JoinChallenge", ""];
		_response = _unit getVariable ["IP_JoinResponse", ""];

		[_caller, _challenge, "DIRECT"] call IP_fnc_simpleSentence; 
		[_unit, _response, "DIRECT"] call IP_fnc_simpleSentence;
		[_unit] join player;
		addSwitchableUnit _unit;
	}];
} else {
	_unit addAction [_actionName, {
		_unit = _this select 0;
		_caller = _this select 1;
		_id = _this select 2;
		_unit removeAction _id;
		
		_challenge = _unit getVariable ["IP_JoinChallenge", ""];
		_response = _unit getVariable ["IP_JoinResponse", ""];

		[_caller, _challenge, "DIRECT"] call IP_fnc_simpleSentence; 
		[_unit, _response, "DIRECT"] call IP_fnc_simpleSentence;
		[_unit] join player;
	}];
};
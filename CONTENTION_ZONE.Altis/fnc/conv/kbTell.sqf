if !(isServer) exitWith {
	"IP_fnc_kbTell has been run on client!" call BIS_fnc_error;
};

params [
	["_speaker", ObjNull, [ObjNull]],
	["_params", [], [[]]]
];

if (local _speaker) then {
	_speaker kbTell _params;	
	waitUntil {_speaker kbWasSaid [(_params select 0), (_params select 1), (_params select 2), 60];
	_speaker setVariable ["IP_SimpleSentence_Talking", false, true];
} else {
	"IP_fnc_kbTell: Speaker is not local!" call BIS_fnc_error;
};
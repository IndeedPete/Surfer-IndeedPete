if !(isServer) exitWith {
	"IP_fnc_kbAddTopic has been run on client!" call BIS_fnc_error;
};

params [
	["_speaker", ObjNull, [ObjNull]],
	["_topic", "", [""]],
    ["_bikb", "\Campaigns\IP_CMP_ICE\cfg\sentences.bikb", [""]]
];

if ((local _speaker) && {!(_speaker kbHasTopic _topic)}) then {
	_speaker kbAddTopic [_topic, _bikb, "", ""];
};
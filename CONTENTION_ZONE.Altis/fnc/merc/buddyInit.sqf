_unit = [_this, 0, IP_Buddy, [objNull]] call BIS_fnc_param;
_keepLoadout = getNumber(missionConfigFile >> "keepLoadout");
//_buddyLoadout = profileNameSpace getVariable ["IP_MERCS_BuddyLoadout", []];

_unit setIdentity "buddy";
_unit setRank "LIEUTENANT";
_unit setVariable ["IP_LiveFeed", true];
_unit setVariable ["IP_Avatar", "img\buddyAvatar.jpg"];
_unit setVariable ["IP_Faction", "ION"];
_unit allowDamage false;
_unit allowFleeing 0;
[_unit, 5] call IP_fnc_setSkill;

if ((_keepLoadout == 1) && (!isNil "IP_MERCS_BuddyLoadout")) then {
	_buddyLoadout = IP_MERCS_BuddyLoadout;
	[_unit, _buddyLoadout] call IP_fnc_setLoadout;
} else {
	[_unit] call IP_fnc_buddyEquipment;
};

[_unit] call IP_fnc_automaticRearm;
[_unit, 0.03, "ICON", "mil_marker", "colorUnknown", "Buddy", true, {true}] call IP_fnc_track;

// Stupid Workaround
_unit spawn {
	_unit = _this;
	
	waitUntil {time > 0};
	
	_uniform = uniform _unit;
	if (isArray(missionConfigFile >> "ShopClothes" >> _uniform >> "texture")) then {
		_arr = getArray(missionConfigFile >> "ShopClothes" >> _uniform >> "texture");
		_unit setObjectMaterial [0, (_arr select 0)];
		_unit setObjectTexture [0, (_arr select 1)];
	} else {
		if (isText(missionConfigFile >> "ShopClothes" >> _uniform >> "texture")) then {_unit setObjectTexture [0, (getText(missionConfigFile >> "ShopClothes" >> _uniform >> "texture"))]};
	};
	
	sleep 1;
	
	_unit enableIRLasers true;
	if (("NVGoggles" in (items _unit)) && ((dayTime < 7) OR (dayTime > 19))) then {_unit assignItem "NVGoggles"};
};
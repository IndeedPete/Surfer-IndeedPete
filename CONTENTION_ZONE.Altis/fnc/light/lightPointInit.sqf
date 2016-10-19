if (!isNil "IP_LightPointInit") exitWith {};
IP_LightPointInit = true;

_this spawn {
	private ["_ehLight"];
	waitUntil {time > 0};

	_this spawn {
		while {true} do {
			waitUntil {!(isNull(player getVariable ["IP_LightPoint", ObjNull])) && {(vehicle player != player) OR {!("acc_flashlight" in (items player))} OR {({_x in primaryWeaponItems player} count ["acc_flashlight", "acc_pointer_IR"] > 0) && (currentWeapon player == primaryWeapon player)}}};
			[player] call IP_fnc_lightPoint;
			waitUntil {(vehicle player == player) && {"acc_flashlight" in (items player)} && {({_x in primaryWeaponItems player} count ["acc_flashlight", "acc_pointer_IR"] == 0) OR (currentWeapon player != primaryWeapon player)}};
		};
	};

	disableSerialization;
	_ehLight = ([] call BIS_fnc_displayMission) displayAddEventHandler [
		"KeyDown",
		{
			if (((_this select 1) in (actionKeys "Headlights")) && {vehicle player == player} && {"acc_flashlight" in (items player)} && {({_x in primaryWeaponItems player} count ["acc_flashlight", "acc_pointer_IR"] == 0) OR (currentWeapon player != primaryWeapon player)}) then {
				playSound "ClickSoft";
				[player] call IP_fnc_lightPoint;
			};
		}
	];
};
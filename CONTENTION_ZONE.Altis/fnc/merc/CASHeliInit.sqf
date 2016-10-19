_this addEventHandler ["Killed", {
	_vehicle = typeOf (_this select 0);
	_inPosession = IP_Main getVariable ["IP_CampVehicles", []];
	_inPosession = _inPosession - [_vehicle];
	IP_Main setVariable ["IP_CampVehicles", _inPosession];
	_prov = if (!isNil "IP_SuppPro_Trans") then {IP_SuppPro_Trans} else {IP_SuppPro_CAS};
	[IP_SuppReq, _prov] call BIS_fnc_removeSupportLink;
}];

(group _this) setGroupID ["Pegasus"];
[_this, 0.03, "ICON", "mil_marker", ([(side _this), true] call BIS_fnc_sideColor), "Pegasus", true, {true}] call IP_fnc_track;
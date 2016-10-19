_mission = getText(missionConfigFile >> "name");
_end = if (getText(missionConfigFile >> "stage") == "A") then {
	_end = switch (_mission) do {
		case "MOut_Renegade": {"End1"};
		case "MOut_Quit": {"End1"};
		case "MTrans01": {"Hub02"};
		default {"Hub01"};
	};
	_end
} else {
	_end = switch (_mission) do {
		case "MMain05": {"Hub03"};
		case "Hub03": {"MMain06"};
		case "MMain06": {"MMain07"};
		case "MMain07": {"MOut_ION"};
		case "MOut_AAF": {"End1"};
		case "MOut_Buddy": {"End1"};
		case "MOut_CSAT": {"End1"};
		case "MOut_DSE": {"End1"};
		case "MOut_EF": {"End1"};
		case "MOut_ION": {"End1"};
		default {"Hub02"};
	};
	_end
};

[_end, true, true] call IP_fnc_endMission;
private ["_mission", "_tcr", "_totalReward", "_currentReward"];
_mission = _this;
_tcr = call IP_fnc_calculateTotalCostRate;
_totalReward = getNumber(missionConfigFile >> "ShopMissions" >> _mission >> "reward");
_currentReward = [(_totalReward * (1 - _tcr)), 100] call IP_fnc_round;
_currentReward
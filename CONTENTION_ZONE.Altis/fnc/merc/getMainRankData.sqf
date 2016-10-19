private ["_count", "_arr"];
_count = [_this, 0, (count IP_MERCS_MissionsDone), [0]] call BIS_fnc_param;

_arr = switch (true) do {
	case ((_count > 4) && (_count <= 8)):{["CORPORAL", "main2.jpg", "mainAvatar2.jpg", "SeniorContractor"]};
	case ((_count > 8) && ((isNil "IP_MERCS_BuddyDied") OR (!(isNil "IP_MERCS_BuddyDied") && {!IP_MERCS_BuddyDied}))):{["SERGEANT", "main3.jpg", "mainAvatar3.jpg", "DetailLeader"]};
	case ((_count > 12) && !(isNil "IP_MERCS_BuddyDied") && {IP_MERCS_BuddyDied}):{["LIEUTENANT", "main4.jpg", "mainAvatar4.jpg", "SectionLeader"]};
	default{["PRIVATE", "main1.jpg", "mainAvatar1.jpg", "Contractor"]};
};

_arr
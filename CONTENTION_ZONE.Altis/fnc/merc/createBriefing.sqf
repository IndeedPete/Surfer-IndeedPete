private ["_briefing", "_tMonth", "_tDay"];

_text = [_this, 0, "", [""]] call BIS_fnc_param;
_executiveText = [_this, 1, "", [""]] call BIS_fnc_param;
_mission = getText(missionConfigFile >> "name");
_contractor = getText(missionConfigFile >> "CfgIdentities" >> "main" >> "name");
_client = getText(missionConfigFile >> "Factions" >> (getText(missionConfigFile >> "ShopMissions" >> _mission >> "client")) >> "displayName");
_location = getText(missionConfigFile >> "ShopMissions" >> _mission >> "location");
_sentences = getArray(missionConfigFile >> "ShopMissions" >> _mission >> "briefing");
_reward = getNumber(missionConfigFile >> "ShopMissions" >> _mission >> "reward");
_commander = getText(missionConfigFile >> "CfgIdentities" >> "commander" >> "name");

_tYear 	= date select 0;
_tMonth = date select 1;
_tDay 	= date select 2;
if (_tMonth < 10) then {_tMonth = format["0%1", _tMonth]};
if (_tDay < 10) then {_tDay = format["0%1", _tDay]};
_tDate = format["%1.%2.%3", _tDay, _tMonth, _tYear];

_contract = "GENERAL ASSIGNMENT CONTRACT
			<br/>
			<br/>Between ION, Incorporated, the CONTRACTOR: %1 and the CLIENT: %2.
			<br/>
			<br/>ION, Incorporated, hereafter referred to as the COMPANY, and the CONTRACTOR agree to enter into a new formal arrangement with the CLIENT commencing on the %3, hereafter referred to as the OPERATION carried out within the area of operation (AOR): %4.
			<br/>
			<br/>OPERATION details:
			<br/>%5
			<br/>
			<br/>The CLIENT is obligated to deposit a service fee of %6€ (EURO) with the:
			<br/>
			<br/>Credit Suisse
			<br/>IBAN: CH5604835016075473007
			<br/>BIC/SWIFT: CRESCHZZ80A
			<br/>Reason for Payment: 10-Digit Client Number
			<br/>
			<br/>prior to the above stated start date in order to commence the OPERATION. The COMPANY keeps 10 percent plus a percentage amount based on the CONTRACTOR's rank within the COMPANY of the charged service fee as general share for conveying, accommodation, transportation and miscellaneous. The CONTRACTOR receives the remaining amount as payout for his efforts. 
			<br/>
			<br/>The Standard Uniform Code of Military Justice, hereafter referred to as the UCMJ, is understood to be voluntarily applied to the CONTRACTOR in full within the AOR during the lifetime of the OPERATION. The CONTRACTOR agrees that the rules of engagement, hereafter referred to as the ROE (expounded in detail in Annex II), fall under the remit of the UCMJ. Furthermore, the OPERATION stipulates NO UNAUTHORIZED USE OF DEADLY FORCE unless fired upon. The COMPANY reserves the right to extend or narrow the scope of the UCMJ as appropriate. Amendments to the UCMJ are to be detailed and countersigned in future addenda to this contract. Agile changes to the ROE are authorized under tactical COMPANY authorized supervision.The CONTRACTOR agrees to the full liability of any and all deviations from the ROE within the OPERATION AOR notwithstanding CLIENT or COMPANY contractual addenda.
			<br/><img image='img\ui_ion_stamp_ca.paa' width='100'/>";

_contract = format [_contract, _contractor, _client, _tDate, _location, _text, _reward];

_briefing = "";
if (_executiveText != "") then {
	_briefing = _executiveText;
} else {
	for "_i" from 0 to (count _sentences - 1) do {_briefing = _briefing + (_sentences select _i) + " "};
};
_briefing = _briefing + "<br/><br/>Executive on Site<br/>" + _commander;

if (_text != "") then {player createDiaryRecord ["Diary", ["Contract", _contract]]};
player createDiaryRecord ["Diary", ["Executive Briefing", _briefing]];
/*
Name: textTiles
Author: IndeedPete
Purpose: Creates fancy text tiles.
----------
Parameters:
_lines - ARRAY of STRING/BOOLEAN: Text lines that should be shown. Boolean value in array causes function to show actual date and time instead. - ["Mission 01", true, "Commander Bacon"]
_duration - NUMBER (OPTIONAL): Duration of text tiles in seconds. - 10 - DEFAULT: 5
*/

_dateStr = call {
	private ["_month", "_day", "_hour", "_minute"];
	
	_month = str (date select 1);
	_day = str (date select 2);
	_hour = str (date select 3);
	_minute = str (date select 4);

	if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
	if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
	if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
	if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

	_time = format ["%1:%2", _hour, _minute];
	_date = format ["%1.%2.%3", _day, _month, str (date select 0)];
	_text = format ["%1, %2", _time, _date];
	
	_text;
};

private ["_lines", "_dateStr", "_text"];

_lines = [_this, 0, [true], [[]]] call bis_fnc_param;
_duration = [_this, 1, 5, [0]] call bis_fnc_param;
_text = "<t align = 'right'>";

for "_i" from 0 to ((count _lines) - 1) do {
	private "_line";
	_line = [_lines, _i, true, ["", true]] call bis_fnc_param;
	if (typeName _line == "BOOL") then {_line = _dateStr};
	_text = _text + _line + "<br/>";
};

[(parseText _text), [safeZoneX + safeZoneW - 0.35 - 0.025, safeZoneY + safeZoneH - 0.25 - 0.05, 0.35, 0.15], _duration] call BIS_fnc_textTiles;
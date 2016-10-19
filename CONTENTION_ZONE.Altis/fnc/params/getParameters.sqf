private "_params";
_params = [];

{
	_params pushBack _x;
} forEach ("(isNumber(_x >> 'idc')) && {isText(_x >> 'type')} && {isText(_x >> 'variable')}" configClasses (missionConfigFile >> "Params"));

_params
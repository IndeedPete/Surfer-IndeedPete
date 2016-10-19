private ["_veh", "_dir", "_v"]; 
_veh = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param; 
_dir = [_this, 1, 0, [0]] call BIS_fnc_param; 
_v = velocity _veh; 
_veh setDir _dir; 
_veh setVelocity [ (_v select 1) * sin _dir - (_v select 0) * cos _dir, (_v select 0) * sin _dir + (_v select 1) * cos _dir, _v select 2 ];
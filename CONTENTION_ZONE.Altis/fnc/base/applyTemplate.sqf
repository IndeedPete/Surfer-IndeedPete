private ["_unit", "_config", "_subConfig", "_applyConfig"];

_applyConfig = {
	_unit = _this select 0;
	_config = _this select 1;
	
	_class = if (typeName _config == "STRING") then {
		(missionConfigFile >> "CharacterTemplates" >> _config)
	} else {
		(missionConfigFile >> "CharacterTemplates" >> (_config select 0) >> (_config select 1))
	};
	
	if (isNumber(_class >> "skill")) then {
		_skill = (getNumber(_class >> "skill"));
		[_unit, _skill] call IP_fnc_setSkill;
	};
	
	if (isText(_class >> "rank")) then {
		_rank = getText(_class >> "rank");
		_unit setRank _rank;
	};
	
	if (isText(_class >> "identity")) then {
		_identity = getText(_class >> "identity");
		//_unit setIdentity _identity;
		[[_unit, _identity], "IP_fnc_setIdentity", nil, true] call BIS_fnc_MP;
	};
	
	if (isText(_class >> "face")) then {
		_face = getText(_class >> "face");
		_unit setFace _face;
	};
	
	if (isText(_class >> "name")) then {
		_name = getText(_class >> "name");
		_unit setName _name;
	};
	
	if (isText(_class >> "speaker")) then {
		_speaker = getText(_class >> "speaker");
		_unit setSpeaker _speaker;
	};
	
	if (isNumber(_class >> "allowDamage")) then {
		_allowDamage = (getNumber(_class >> "allowDamage")) == 1;
		_unit allowDamage _allowDamage;
	};
	
	if (isText(_class >> "uniform")) then {
		removeUniform _unit;
		_uniform = getText(_class >> "uniform");
		_unit forceAddUniform _uniform;
	};
	
	if (isArray(_class >> "texture")) then {
		_arr = getArray(_class >> "texture");
		_unit setObjectMaterial [0, (_arr select 0)];
		_unit setObjectTextureGlobal [0, (_arr select 1)];
	} else {
		if (isText(_class >> "texture")) then {
			_txt = getText(_class >> "texture");
			_unit setObjectTextureGlobal [0, _txt];
		};
	};
	
	if (isText(_class >> "headgear")) then {
		removeHeadgear _unit;
		_headgear = getText(_class >> "headgear");
		_unit addHeadgear _headgear;
	};
	
	if (isText(_class >> "goggles")) then {
		removeGoggles _unit;
		_goggles = getText(_class >> "goggles");
		_unit addGoggles _goggles;
	};
	
	if (isText(_class >> "vest")) then {
		removeVest _unit;
		_vest = getText(_class >> "vest");
		_unit addVest _vest;
	};
	
	if (isText(_class >> "backpack")) then {
		removeBackpack _unit;
		_backpack = getText(_class >> "backpack");
		_unit addBackpack _backpack;
	};
	
	if ((isArray(_class >> "weapons")) && (isText(_class >> "magazines"))) then {
		removeAllWeapons _unit;
		_weapons = getArray(_class >> "weapons");
		_magazines = call(compile(getText(_class >> "magazines")));		
		
		{_unit addMagazines _x} forEach _magazines;		
		{
			if (_x != "") then {
				_unit addWeapon _x;
			};
		} forEach _weapons;
		
		_unit selectWeapon ((weapons _unit) select 0);
	};
	
	if (isArray(_class >> "items")) then {
		_items = getArray(_class >> "items");
		{
			if (_x != "") then {
				_unit addItem _x;
			};
		} forEach _items;
	};
	
	if (isText(_class >> "attachments")) then {
		_items = call(compile(getText(_class >> "attachments")));
		
		{_unit addPrimaryWeaponItem _x} forEach (_items select 0);
		if (count _items > 1) then {{_unit addHandgunItem _x} forEach (_items select 1)};
	};
	
	if (isArray(_class >> "night")) then {
		{_unit unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "IP_NVGoggles_SNW"];
		_night = getArray(_class >> "night");
		_atAll = call compile (_night select 0);
		_NV = call compile (_night select 1);
		
		if (_atAll) then {
			if (_NV) then {
				_unit linkItem "NVGoggles";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
			} else {
				_unit addPrimaryWeaponItem "acc_flashlight";
				_unit enableGunLights "forceOn";
			};
		};
	};
	
	if (isText(_class >> "variables")) then {
		_variables = call(compile(getText(_class >> "variables")));		
		{_unit setVariable _x} forEach _variables;
	};
	
	if (isArray(_class >> "conversations")) then {
		_conversations = getArray(_class >> "conversations");		
		if (count _conversations > 0) then {
			{[_unit, _x] call IP_fnc_addConversation} forEach _conversations;
		};
	};
	
	if (isText(_class >> "groupID")) then {
		_groupID = getText(_class >> "groupID");		
		(group _unit) setGroupID [_groupID];
	};
	
	if (isText(_class >> "code")) then {
		_code = compile(getText(_class >> "code"));		
		_unit call _code;
	};
	
	if (isNumber(_class >> "silenced") && {getNumber(_class >> "silenced") == 1}) then {
		[_unit] call IP_fnc_applySilencer;
	};
};

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_config = [_this, 1, "", [""]] call BIS_fnc_param;
_subConfig = [_this, 2, "", [""]] call BIS_fnc_param;

[_unit, _config] call _applyConfig;
if (_subConfig != "") then {[_unit, [_config, _subConfig]] call _applyConfig};
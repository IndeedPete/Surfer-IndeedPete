/* FLAY_fnc_ExplosionDetector
 * 
 * Description:
 *      This script is used to detect when a satchel or demolition charge detonates.
 *
 * Usage:
 *      [<detector>, (<radius>), (<callback>)] call FLAY_fnc_ExplosionDetector
 *
 * Params:
 *       <detector>: OBJECT - Any object (used to determine the detection radius). 
 *         <radius>: NUMBER - Maximum distance from the detector an explosion will be detected.
 *         <callback>: CODE   - Function that should be called when explosion is detected.
 *
 * Notes:
 *      The callback is passed two arguments when an explosion is detected:
 *      
 *        <detector>: OBJECT - The detector object. 
 *       <explosive>: OBJECT - The explosive object that detonated.
 */
 
private ["_detector", "_radius", "_callback"];

_detector = _this select 0;
_radius = [_this,1,50,[0]] call BIS_fnc_param;
_callback = [_this,2,{},[{}]] call BIS_fnc_param;

_detector setVariable ["flay.detector.status", false];
_detector setVariable ["flay.detector.radius", _radius];
_detector setVariable ["flay.detector.callback", _callback];

FLAY_ev_ExplosionDetectorHandler = {

    _ammo = _this select 6;
        
    if (_ammo in ["DemoCharge_Remote_Ammo", "SatchelCharge_Remote_Ammo"]) then { 
        
        _this spawn {
        
            private ["_detector", "_unit", "_ammo", "_explosive", "_distance", "_radius", "_callback"];
        
            _detector = _this select 0;
            _unit = _this select 1;    // unit that placed the explosive
            _ammo = _this select 6;
                        
            _explosive = (position _unit) nearestObject _ammo;
            
            waitUntil { not (alive _explosive) };
            
            _distance = _explosive distance _detector;
            _radius = _detector getVariable ["flay.detector.radius", 0];
            
            if (_distance < _radius) then {
                _detector setVariable ["flay.detector.status", true];
                _callback = _detector getVariable "flay.detector.callback";
                if (!isNil _callback) then {
                    [_detector, _explosive] call _callback;
                };
            };
        };
    };
};

_detector addEventHandler ["FiredNear", { _this call FLAY_ev_ExplosionDetectorHandler; } ];  
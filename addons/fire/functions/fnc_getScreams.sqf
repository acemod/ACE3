#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns a list of scream sounds that a unit will play when on fire.
 *
 * Arguments:
 * 0: Unit <OBJECT|STRING>
 *
 * Return Value:
 * Scream sounds <ARRAY of STRING>
 *
 * Example:
 * player call ace_fire_fnc_getScreams
 *
 * Public: Yes
 */

params [["_unitClass", objNull, [objNull, ""]]];
TRACE_1("fnc_getScreams",_unitClass);

if (_unitClass isEqualType objNull) then {
    _unitClass = typeOf _unitClass;
};
if (_unitClass == "" || !(_unitClass isKindOf "CAManBase")) exitWith { [] };

// If unit is defined in hash, grab sounds and return
// If not, check each parent of the class until a value is defined
GVAR(screams) getOrDefaultCall [_unitClass, {
    private _type = _unitClass;
    private _return = [];
    while {true} do {
        _type = configName inheritsFrom (configFile >> "CfgVehicles" >> _type);
        if (_type in GVAR(screams)) exitWith { _return = GVAR(screams) get _type };
    };
    _return // return
}];

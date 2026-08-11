#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns a list of scream sounds that a unit will play when on fire.
 *
 * Arguments:
 * 0: Unit <OBJECT or STRING>
 *
 * Return Value:
 * Scream sounds <ARRAY of STRINGs>
 *
 * Example:
 * player call ace_fire_fnc_getScreamSounds
 *
 * Public: Yes
 */

params [["_unitClass", objNull, [objNull, ""]]];
TRACE_1("fnc_getScreamSounds",_unitClass);

if (_unitClass isEqualType objNull) then {
    _unitClass = typeOf _unitClass;
};
if (_unitClass == "" || !(_unitClass isKindOf "CAManBase")) exitWith { [] };

// If unit is defined in hash, grab sounds and return
// If not, check each parent of the class until a value is defined
GVAR(screamSounds) getOrDefaultCall [toLowerANSI _unitClass, {
    private _cfg = configFile >> "CfgVehicles" >> _unitClass;
    private _return = getArray (_cfg >> QGVAR(screamSounds));
    while {!isNull _cfg} do {
        _cfg = inheritsFrom _cfg;
        if ((toLowerANSI configName _cfg) in GVAR(screamSounds)) exitWith { _return = GVAR(screamSounds) get (toLowerANSI configName _cfg) };
    };
    _return
}, true] // return

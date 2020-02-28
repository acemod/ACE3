#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Vanilla EntityKilled mission EH, attempts to set correct source/killer for other killed event handlers.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Killer <OBJECT>
 * 2: Instigator <OBJECT>
 * 3: Use Effects <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, player, true] call ace_medical_status_fnc_handleKilledMission
 *
 * Public: No
 */

params ["_unit", "_killer", "_instigator", "_useEffects"];
TRACE_4("handleKilledMission",_unit,_killer,_instigator,_useEffects);

// ensure event is only called once
if (_unit isEqualTo (_unit getVariable [QGVAR(killedMission), objNull])) exitWith {
    _this set [0, objNull];
    _this set [1, objNull];
    _this set [2, objNull];
};
_unit setVariable [QGVAR(killedMission), _unit];

private _causeOfDeath = _unit getVariable [QEGVAR(medical,causeOfDeath), "#scripted"];

// if undefined then it's a death not caused by ace's setDead (mission setDamage, disconnect)
if (_causeOfDeath != "#scripted") then {
    _killer = _unit getVariable [QEGVAR(medical,lastDamageSource), _killer]; // vehicle
    _instigator = _unit getVariable [QEGVAR(medical,lastInstigator), _instigator]; // unit in the turret

    // All Killed EHs uses the same array, so we can modify it now to pass the correct killer/instigator
    if (missionNamespace getVariable [QEGVAR(medical,modifyKilledArray), true]) then { // getVar so this can be disabled
        _this set [1, _killer];
        _this set [2, _instigator];
    };
};
TRACE_3("killer mission info",_killer,_instigator,_causeOfDeath);

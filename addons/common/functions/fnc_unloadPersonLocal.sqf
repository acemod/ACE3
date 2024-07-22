#include "..\script_component.hpp"
/*
 * Author: ViperMaul
 * Unload a person from a vehicle, local
 *
 * Arguments:
 * 0: Unit to unload <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Unloader (player) <OBJECT> (default: objNull)
 *
 * Return Value:
 * Succesfully unloaded person <BOOL>
 *
 * Example:
 * [bob, car, bob] call ace_common_fnc_unloadPersonLocal
 *
 * Public: No
 */

#define GROUP_SWITCH_ID QFUNC(loadPerson)

params ["_unit", ["_vehicle", objNull], ["_unloader", objNull]];
TRACE_3("unloadpersonLocal",_unit,_vehicle,_unloader);

//This covers testing vehicle stability and finding a safe position
private _emptyPos = [_vehicle, (typeOf _unit), _unloader] call EFUNC(common,findUnloadPosition);
TRACE_1("findUnloadPosition",_emptyPos);
if (_emptyPos isEqualTo []) then {
    _emptyPos = [_vehicle, (typeOf _unit), _unloader] call EFUNC(common,findUnloadPosition);
    TRACE_1("findUnloadPosition 2nd attempt",_emptyPos);
    if (_emptyPos isEqualTo []) then {
        _emptyPos = [_vehicle, (typeOf _unit), _unloader] call EFUNC(common,findUnloadPosition);
        TRACE_1("findUnloadPosition 3rd attempt",_emptyPos);
    };
};

if (count _emptyPos != 3) exitwith {
    WARNING_4("Could not find unload pos %1-ASL: %2 isTouchingGround: %3 Speed: %4",_vehicle,getPosASL _vehicle,isTouchingGround _vehicle,speed _vehicle);
    if ((!isNull _unloader) && {[_unloader] call FUNC(isPlayer)}) then {
        //display text saying there are no safe places to exit the vehicle
        [QGVAR(displayTextStructured), [localize LSTRING(NoRoomToUnload)], [_unloader]] call CBA_fnc_targetEvent;
    };
    false
};

unassignVehicle _unit;
[_unit] orderGetIn false;

TRACE_2("Ejecting",alive _unit,local _vehicle);

if (local _vehicle) then {
    _unit action ["Eject", _vehicle];
    // Failsafe - sometimes eject alone doesn't work, but moveOut does
    [{
        params ["_unit"];

        if (!isNull objectParent _unit) then {
            if ([_unit] call FUNC(isAwake)) then {
                WARNING_1("UnloadPersonLocal [%1] did not eject normally",_unit);
            } else {
                TRACE_1("UnloadPersonLocal dead/uncon did not eject normally",_unit);
            };
            moveOut _unit;
        };
    }, [_unit], 1] call CBA_fnc_waitAndExecute;

} else {
    moveOut _unit;
};

// Wait until unit has actually exited vehicle and then move them to the unload position
if (alive _unit) then {
    [{
        params ["_unit", "_emptyPos"];
        (alive _unit) && {isNull objectParent _unit}
    }, {
        params ["_unit", "_emptyPos"];
        TRACE_2("unload success",_unit,_emptyPos);
        _unit setPosASL AGLToASL _emptyPos;
    }, [_unit, _emptyPos], 2, {
        params ["_unit", "_emptyPos"];
        if (!alive _unit) exitWith {};
        WARNING_2("timeout %1->%2",_unit,objectParent _unit);
    }] call CBA_fnc_waitUntilAndExecute;
};

[_unit, false, GROUP_SWITCH_ID, side group _unit] call FUNC(switchToGroupSide);

true

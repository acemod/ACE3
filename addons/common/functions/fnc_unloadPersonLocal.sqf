#include "script_component.hpp"
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
 * [bob, car, bob] call ace_common_fnc_unloadpersonLocal
 *
 * Public: No
 */

#define GROUP_SWITCH_ID QFUNC(loadPerson)

params ["_unit", "_vehicle", ["_unloader", objNull]];
TRACE_3("params",_unit,_vehicle,_unloader);

//This covers testing vehicle stability and finding a safe position
private _emptyPos = [_vehicle, (typeOf _unit), _unloader] call EFUNC(common,findUnloadPosition);
TRACE_1("findUnloadPosition",_emptyPos);

if (count _emptyPos != 3) exitwith {
    WARNING_4("Could not find unload pos %1-ASL: %2 isTouchingGround: %3 Speed: %4",_vehicle, getPosASL _vehicle, isTouchingGround _vehicle, speed _vehicle);
    if ((!isNull _unloader) && {[_unloader] call FUNC(isPlayer)}) then {
        //display text saying there are no safe places to exit the vehicle
        [QGVAR(displayTextStructured), [localize LSTRING(NoRoomToUnload)], [_unloader]] call CBA_fnc_targetEvent;
    };
    false
};

unassignVehicle _unit;
[_unit] orderGetIn false;

TRACE_1("Ejecting", alive _unit);

_unit action ["Eject", vehicle _unit];

[{
    params ["_unit", "_emptyPos"];

    _unit setPosASL AGLToASL _emptyPos;

    if !([_unit] call FUNC(isAwake)) then {
        TRACE_1("Check if isAwake", [_unit] call FUNC(isAwake));

        if (driver _unit == _unit) then {
            private _anim = [_unit] call FUNC(getDeathAnim);

            [_unit, _anim, 1, true] call FUNC(doAnimation);

            [{
                params ["_unit", "_anim"];
                if ((_unit getVariable "ACE_isUnconscious") and (animationState _unit != _anim)) then {
                    [_unit, _anim, 2, true] call FUNC(doAnimation);
                };
            }, [_unit, _anim], 0.5] call CBA_fnc_waitAndExecute;
        };
    };
}, [_unit, _emptyPos], 0.5] call CBA_fnc_waitAndExecute;

[_unit, false, GROUP_SWITCH_ID, side group _unit] call FUNC(switchToGroupSide);

private _loaded = _vehicle getvariable [QGVAR(loaded_persons),[]];
_loaded deleteAt (_loaded find _unit);

_vehicle setvariable [QGVAR(loaded_persons), _loaded, true];

true

/*
 * Author: ViperMaul
 * Unload a person from a vehicle, local
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Returns true if succesfully unloaded person <BOOL>
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define GROUP_SWITCH_ID QUOTE(FUNC(loadPerson))

private ["_loaded", "_emptyPos","_validVehiclestate"];
PARAMS_2(_unit,_vehicle);
_validVehiclestate = true;

if (_vehicle isKindOf "Ship" ) then {
    if !(speed _vehicle <1 && {(((getPosATL _vehicle) select 2) < 2)}) then {_validVehiclestate = false};
    TRACE_1("SHIP Ground Check", getPosATL _vehicle );
    _emptyPos = ((getPosASL _vehicle) call EFUNC(common,ASLtoPosition) findEmptyPosition [0, 13, typeof _unit]); // TODO: if spot is underwater pick another spot.
} else {
    if (_vehicle isKindOf "Air" ) then {
        if !(speed _vehicle <1 && {isTouchingGround _vehicle})  then {_validVehiclestate = false};
        TRACE_1("Vehicle Ground Check", isTouchingGround _vehicle);
        _emptyPos = (getPosASL _vehicle) call EFUNC(common,ASLtoPosition);
        _emptyPos = [(_emptyPos select 0) + random(5), (_emptyPos select 1) + random(5), _emptyPos select 2 ];
    } else {
        if !(speed _vehicle <1 && {(((getPosATL _vehicle) select 2) < 2)})  then {_validVehiclestate = false};
        TRACE_1("Vehicle Ground Check", isTouchingGround _vehicle);
        _emptyPos = ((getPosASL _vehicle) call EFUNC(common,ASLtoPosition) findEmptyPosition [0, 13, typeof _unit]);
    };
};

TRACE_1("getPosASL Vehicle Check", getPosASL _vehicle);
if (!_validVehiclestate) exitwith {
    ACE_LOGWARNING(format ["Unable to unload patient because invalid (%1) vehicle state. Either moving or Not close enough on the ground. position: %2 isTouchingGround: %3 Speed: %4", _vehicle, getPos _vehicle, isTouchingGround _vehicle, speed _vehicle]);
    false
};

if (count _emptyPos == 0) exitwith {
    ACE_LOGWARNING(format ["No safe empty spots to unload patient. %1", _emptyPos]);
    false
};  //consider displaying text saying there are no safe places to exit the vehicle


unassignVehicle _unit;
[_unit] orderGetIn false;
TRACE_1("Ejecting", alive _unit);
_unit action ["Eject", vehicle _unit];
[ {
    private "_anim";
    PARAMS_2(_unit,_emptyPos);
    _unit setPosASL (_emptyPos call EFUNC(common,PositiontoASL));
    if (!([_unit] call FUNC(isAwake))) then {
        TRACE_1("Check if isAwake", [_unit] call FUNC(isAwake));
        if (driver _unit == _unit) then {
            _anim = [_unit] call EFUNC(common,getDeathAnim);
            [_unit, _anim, 1, true] call EFUNC(common,doAnimation);
            [{
                _unit = _this select 0;
                _anim = _this select 1;
                if ((_unit getVariable "ACE_isUnconscious") and (animationState _unit != _anim)) then {
                    [_unit, _anim, 2, true] call EFUNC(common,doAnimation);
                };
            }, [_unit, _anim], 0.5, 0] call EFUNC(common,waitAndExecute);
        };
    };
},[_unit,_emptyPos], 0.5, 0] call EFUNC(common,waitAndExecute);


[_unit, false, GROUP_SWITCH_ID, side group _unit] call FUNC(switchToGroupSide);

_loaded = _vehicle getvariable [QGVAR(loaded_persons),[]];
_loaded = _loaded - [_unit];
_vehicle setvariable [QGVAR(loaded_persons),_loaded,true];

true

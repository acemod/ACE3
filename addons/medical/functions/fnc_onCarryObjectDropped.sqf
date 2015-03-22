/*
 * Author: Glowbal
 * Called on event CarryObjectDropped
 *
 * Arguments:
 * 0: The caller <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit","_params"];
_caller = _this select 0;
_target = _caller getvariable [QGVAR(carrying), objNull];
_carrying = _caller getvariable [QGVAR(isCarrying), -1];

if (_carrying >= 0) then {
    if !(isNull (_target getvariable [QGVAR(copyOfUnit), objNull])) then {
        _copy = _target;
        _target = _copy getvariable [QGVAR(copyOfUnit), objNull];
        if (isMultiplayer) then {
            _target hideObjectGlobal false;
        } else {
            _target hideObject false;
        };
        detach _copy;
        deleteVehicle _copy;
    };

	_caller setvariable [QGVAR(isCarrying), -1, true];
    if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
        _caller removeWeapon "ACE_FakePrimaryWeapon";
    };

    [_target, false] call EFUNC(common,disableAI);
    _caller setvariable[QGVAR(onStartMovingUnitParams), nil];

    // handle the drag & carry administration
    if (_carrying == 0) then {
        _target setvariable [QGVAR(beingDragged), nil, true];
        _caller setvariable [QGVAR(dragging), nil, true];
    } else {
        _target setvariable [QGVAR(beingCarried), nil, true];
        _caller setvariable [QGVAR(carrying), nil, true];
    };

    // handle the drag & carry animiations
    if ([_caller] call EFUNC(common,isAwake) && (vehicle _caller == _caller)) then {
        [_caller,"amovpercmstpsraswrfldnon_amovpknlmstpslowwrfldnon", 1] call EFUNC(common,doAnimation);
    };

    if (vehicle _target == _target) then {
        if (_carrying == 0) then {
            [_target,"AinjPpneMstpSnonWrflDb_release", 2, true] call EFUNC(common,doAnimation);
        } else {
            [_target,"AinjPfalMstpSnonWrflDnon_carried_Down", 2, true] call EFUNC(common,doAnimation);
        };
    } else {
        if ([_target] call EFUNC(common,isAwake)) then {
            [_target,"", 2] call EFUNC(common,doAnimation); // TODO play animation for the current seat instead
        } else {
            // this might not work properly
            [_target,([_target] call EFUNC(common,getDeathAnim)), 1] call EFUNC(common,doAnimation);
        };
    };

    // Ensure that the unit does not get dropped through the floor of a building
    if (!surfaceIsWater getPos _caller) then {
        [{
            EXPLODE_3_PVT(_this,_caller,_target,_killOnDrop);
            if (vehicle _target == _target && (vehicle _caller == _caller)) then {
                // This will set the target body/unit on the correct position, so it doesn't fall through floors.
                _positionUnit = getPosATL _target;
                _positionUnit set [2, (getPosATL _caller) select 2];
                _target setPosATL _positionUnit;
            };
        }, [_caller,_target], 0.5, 0.5] call EFUNC(common,waitAndExecute);
    };
};
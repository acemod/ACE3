/**
 * fnc_handleDropUnit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


#include "script_component.hpp"


private ["_caller","_target","_killOnDrop","_dragging"];
_caller = _params select 0;
_target = _params select 1;
_killOnDrop = _params select 2;
_dragging = _params select 3;

[format["fnc_handleDropUnit: %1",_this]] call EFUNC(common,debug);

if ((isNull ([_caller] call EFUNC(common,getCarriedObj))) || !([_caller] call EFUNC(common,isAwake)) || (vehicle _caller != _caller)) then {

    if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
        _caller removeWeapon "ACE_FakePrimaryWeapon";
    };

    [_target, false] call EFUNC(common,disableAI_f);
    _caller setvariable[QGVAR(onStartMovingUnitParams), nil];

    // handle the drag & carry administration
    if (_dragging) then {
        _target setvariable [QGVAR(beingDragged),nil,true];
        _caller setvariable [QGVAR(dragging),nil,true];
    } else {
        _target setvariable [QGVAR(beingCarried),nil,true];
        _caller setvariable [QGVAR(carrying),nil,true];
    };

    // This is for good messure, the object should already have been dropped if it ever reaches this
    [_caller,ObjNull] call EFUNC(common,carryObj);

    // handle the drag & carry animiations
    if ([_caller] call EFUNC(common,isAwake) && (vehicle _caller == _caller)) then {
        [_caller,"amovpercmstpsraswrfldnon_amovpknlmstpslowwrfldnon", 1] call EFUNC(common,doAnimation);
    };

    if (vehicle _target == _target) then {
        if (_dragging) then {
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

            if (_killOnDrop) then {
                _unit setDamage 1;
            };
            [format["fnc_handleDropUnit: %1 - passed setPosATL fix", _caller]] call EFUNC(common,debug);
        }, [_caller,_target,_killOnDrop], 0.5, 0.5] call EFUNC(common,waitAndExecute);
    } else {
        if (_killOnDrop) then {
            _unit setDamage 1;
        };
    };

    ["onDropInjured", [_caller], [_caller, _unit, 0]] call EFUNC(common,targetEvent);

};
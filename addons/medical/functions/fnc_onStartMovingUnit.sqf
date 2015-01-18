/**
 * fnc_onStartMovingUnit.sqf
 * @Descr: is called when a unit start to move another unit through either carry or drag actions.
 *         This will monitor until the caller (unit carrying another unit) is no longer awake, in a vehicle or dropped the unit,
 *         after which it will handle the required animations and administration.
 *
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, unit OBJECT, killOnDrop BOOL (Should the unit be killed when being dropped), dragging BOOL (true means the dragging animations should be played, false will play carry animations)]
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"

// Time in seconds. There is no need to run this every frame, but it should still be in real time. The user should not experience any delays here.
#define TIME_BETWEEN_CHECKS   0.1

private ["_caller","_target","_killOnDrop","_dragging"];
_caller = _this select 0;
_target = _this select 1;
_killOnDrop = _this select 2;
_dragging = _this select 3;

[{
        private ["_caller","_target","_killOnDrop","_dragging"];
        _caller = (_this select 0) select 0;
        _target = (_this select 0) select 1;
        _killOnDrop = (_this select 0) select 2;
        _dragging = (_this select 0) select 3;

        if ((isNull ([_caller] call EFUNC(common,getCarriedObj))) || !([_caller] call EFUNC(common,isAwake)) || (vehicle _caller != _caller)) then {
            [_caller,ObjNull] call EFUNC(common,carryObj);

            // handle the drag & carry administration
            if (_dragging) then {
                _target setvariable [QGVAR(beingDragged),objNull,true];
                _caller setvariable [QGVAR(dragging),objNull,true];
            } else {
                _target setvariable [QGVAR(beingCarried),objNull,true];
                _caller setvariable [QGVAR(carrying),objNull,true];
            };

            // handle the drag & carry animiations
            if ([_caller] call EFUNC(common,isAwake) && (vehicle _caller == _caller)) then {
                if (vehicle _caller == _caller) then {
                    [_caller,"amovpercmstpsraswrfldnon_amovpknlmstpslowwrfldnon", 1] call EFUNC(common,doAnimation);
                };
            };

            if ([_target] call EFUNC(common,isAwake)) then {
                if (vehicle _target == _target) then {
                    if (_dragging) then {
                        [_target,"AinjPpneMstpSnonWrflDb_release",1] call EFUNC(common,doAnimation);
                    } else {
                        [_target,"",1] call EFUNC(common,doAnimation);
                    };
                } else {
                    [_target,"", 1] call EFUNC(common,doAnimation); // TODO play animation for the current seat instead
                };
            } else {
                // TODO play animation for dropping first.
                [_target,([_target] call EFUNC(common,getDeathAnim)), 1] call EFUNC(common,doAnimation);
            };


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

                }, [_caller,_target,_killOnDrop], 0.5, 0.5] call EFUNC(common,waitAndExecute);

            } else {
                if (_killOnDrop) then {
                    _unit setDamage 1;
                };
            };

            ["onDropInjured", [_caller], [_caller, _unit, 0]] call EFUNC(common,targetEvent);
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
}, TIME_BETWEEN_CHECKS, [_caller, _unit, _killOnDrop, _dragging] ] call CBA_fnc_addPerFrameHandler;
#include "script_component.hpp"
/*
 * Author: commy2
 * Force local unit into ragdoll / unconsciousness animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Is unconscious (optional, default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_engine_fnc_setUnconsciousAnim
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_isUnconscious", true, [false]]];

if (!local _unit) exitWith {
    ERROR("Unit not local or null");
};

_unit setUnconscious _isUnconscious;

if (_isUnconscious) then {
    // eject from static weapon
    if (vehicle _unit isKindOf "StaticWeapon") then {
        [_unit] call EFUNC(common,unloadPerson);
    };

    // set animation inside vehicles
    if (vehicle _unit != _unit) then {
        private _unconAnim = _unit call EFUNC(common,getDeathAnim);
        [_unit, _unconAnim] call EFUNC(common,doAnimation);
    };
} else {
    // reset animation inside vehicles
    if (vehicle _unit != _unit) then {
        private _awakeAnim = _unit call EFUNC(common,getAwakeAnim);
        [_unit, _awakeAnim, 2] call EFUNC(common,doAnimation);
    } else {
        // and on foot
        [_unit, "AmovPpneMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);

        if (currentWeapon _unit == secondaryWeapon _unit && {currentWeapon _unit != ""}) then {
            [_unit, "AmovPknlMstpSrasWlnrDnon", 2] call EFUNC(common,doAnimation);
        };

        [{
            params ["_unit"];

            if (animationState _unit == "unconscious" && {lifeState _unit != "INCAPACITATED"}) then {
                [_unit, "AmovPpneMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
            };
        }, _unit, 0.5] call CBA_fnc_waitAndExecute;
    };
};

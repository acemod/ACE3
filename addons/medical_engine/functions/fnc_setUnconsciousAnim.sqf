#include "..\script_component.hpp"
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
TRACE_2("setUnconsciousAnim",_unit,_isUnconscious);

if (!local _unit) exitWith {
    ERROR_1("Unit %1 not local or null",_unit);
};

_unit setUnconscious _isUnconscious;

if (_isUnconscious) then {
    // eject from static weapon
    if (vehicle _unit isKindOf "StaticWeapon" && {!(vehicle _unit isKindOf "Pod_Heli_Transport_04_crewed_base_F")}) then {
        TRACE_2("ejecting from static weapon",_unit,vehicle _unit);
        [_unit] call EFUNC(common,unloadPerson);
    };

    // set animation inside vehicles
    if (!isNull objectParent _unit) then {
        private _unconAnim = _unit call EFUNC(common,getDeathAnim);
        TRACE_2("inVehicle - playing death anim",_unit,_unconAnim);
        [_unit, _unconAnim] call EFUNC(common,doAnimation);
    };
} else {
    // reset animation inside vehicles
    if (!isNull objectParent _unit) then {
        private _awakeAnim = _unit call EFUNC(common,getAwakeAnim);
        TRACE_2("inVehicle - playing awake anim",_unit,_awakeAnim);
        [_unit, _awakeAnim, 2] call EFUNC(common,doAnimation);
    } else {
        // and on foot
        TRACE_1("onfoot - playing standard anim",_unit);
        [_unit, "AmovPpneMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);

        if (currentWeapon _unit == secondaryWeapon _unit && {currentWeapon _unit != ""}) then {
            [_unit, "AmovPknlMstpSrasWlnrDnon", 2] call EFUNC(common,doAnimation);
        };

        [{
            params ["_unit"];
            TRACE_3("after delay",_unit,animationState _unit,lifeState _unit);
            if (!alive _unit) exitWith {};
            // Fix unit being in locked animation with switchMove (If unit was unloaded from a vehicle, they may be in deadstate instead of unconscious)
            private _animation = animationState _unit;
            if ((_animation == "unconscious" || {_animation == "deadstate" || {_animation find QGVAR(uncon_anim) != -1}}) && {lifeState _unit != "INCAPACITATED"}) then {
                [_unit, "AmovPpneMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
                TRACE_1("forcing SwitchMove",animationState _unit);
            };
        }, _unit, 0.5] call CBA_fnc_waitAndExecute;
    };
};

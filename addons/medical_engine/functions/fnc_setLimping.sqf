#include "script_component.hpp"
/*
 * Author: commy2
 * Forces a unit to limp or not.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Limping (optional, default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_engine_fnc_setLimping
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (!local _unit) exitWith { ERROR("Unit not local or null"); };

private _isLimping = false;

if (EGVAR(medical,fractures) > 0) then {
    private _fractures = _unit getVariable [QEGVAR(medical,fractures), [0,0,0,0,0,0]];
    if (((_fractures select 4) == 1) || {(_fractures select 5) == 1}) then {
        TRACE_1("limping because of fracture",_fractures);
        _isLimping = true;
    };

    if (EGVAR(medical,fractures) == 2) then { // block sprinting if we have a leg splint on
        private _isSprintBlocked = ((_fractures select 4) == -1) || {(_fractures select 5) == -1};
        TRACE_2("",_isSprintBlocked,_fractures);
        if (_isSprintBlocked || {!isSprintAllowed _unit}) then { // only update status effect if we need to
            [_unit, "blockSprint", QEGVAR(medical,fracture), _isSprintBlocked] call EFUNC(common,statusEffect_set);
        };
    };
};

if (!_isLimping && {EGVAR(medical,limping) > 0}) then {
    private _woundsToCheck = _unit getVariable [QEGVAR(medical,openWounds), []];
    if (EGVAR(medical,limping) == 2) then {
        _woundsToCheck = _woundsToCheck + (_unit getVariable [QEGVAR(medical,bandagedWounds), []]); // append will break things
    };
    {
        _x params ["_xClassID", "_xBodyPartN", "_xAmountOf", "", "_xDamage"];
        if ((_xBodyPartN > 3) && {_xAmountOf > 0} && {_xDamage > LIMPING_DAMAGE_THRESHOLD} && {
                    (EGVAR(medical_damage,woundsData) select (_xClassID / 10)) select 7}) exitWith { // select _causeLimping from woundsData
            TRACE_1("limping because of wound",_x);
            _isLimping = true;
        };
    } forEach _woundsToCheck;
};
_unit setVariable [QEGVAR(medical,isLimping), _isLimping, true];

// refresh
private _isDamaged = _unit getHitPointDamage "HitLegs" >= DAMAGED_MIN_THRESHOLD && {_unit getHitPointDamage "HitLegs" != LIMPING_MIN_DAMAGE};

[_unit, "Legs", _isDamaged] call FUNC(damageBodyPart);

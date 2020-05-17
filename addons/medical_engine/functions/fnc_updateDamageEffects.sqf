#include "script_component.hpp"
/*
 * Author: commy2, PabstMirror
 * Updates damage effects for limping and fractures
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Limping (optional, default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_engine_fnc_updateDamageEffects
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (!local _unit) exitWith { ERROR_2("updateDamageEffects: Unit not local or null [%1:%2]",_unit,typeOf _unit); };

private _isLimping = false;

if (EGVAR(medical,fractures) > 0) then {
    private _fractures = GET_FRACTURES(_unit);
    TRACE_1("",_fractures);
    if (((_fractures select 4) == 1) || {(_fractures select 5) == 1}) then {
        TRACE_1("limping because of fracture",_fractures);
        _isLimping = true;
    };
    private _aimFracture = 0;
    if ((_fractures select 2) == 1) then { _aimFracture = _aimFracture + 4; };
    if ((_fractures select 3) == 1) then { _aimFracture = _aimFracture + 4; };

    if (EGVAR(medical,fractures) == 2) then { // the limp with a splint will still cause effects
        private _isSprintBlocked = ((_fractures select 4) == -1) || {(_fractures select 5) == -1}; // block sprinting if we have a leg splint on
        if (_isSprintBlocked || {!isSprintAllowed _unit}) then { // only update status effect if we need to
            TRACE_1("updating status effect",_isSprintBlocked);
            [_unit, "blockSprint", QEGVAR(medical,fracture), _isSprintBlocked] call EFUNC(common,statusEffect_set);
        };
        if ((_fractures select 2) == -1) then { _aimFracture = _aimFracture + 2; };
        if ((_fractures select 3) == -1) then { _aimFracture = _aimFracture + 2; };
    };
    _unit setVariable [QGVAR(aimFracture), _aimFracture, false]; // local only var, used in ace_medical's postInit to set ACE_setCustomAimCoef
};

if (!_isLimping && {EGVAR(medical,limping) > 0}) then {
    private _woundsToCheck = GET_OPEN_WOUNDS(_unit);
    if (EGVAR(medical,limping) == 2) then {
        _woundsToCheck = _woundsToCheck + GET_BANDAGED_WOUNDS(_unit); // do not append
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

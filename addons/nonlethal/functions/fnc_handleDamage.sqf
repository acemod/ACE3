#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * handleDamage EH.
 *
 * Arguments:
 * handleDamage params <MISC>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"] call ace_nonlethal_fnc_handleDamage
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

// Exit if bullet is not part of NonLethal
private _nonlethalType = getText (configOf _projectile >> "ACE_nonLethalType");
if (_nonlethalType isEqualTo "") exitWith {};

// Calculate how much of an effect the nonlethal has had on the unit
private _threshold = _unit getVariable [QGVAR(threshold), 0];

switch (_nonLethalType) do {
    case "rubber": {
        _threshold =  _threshold + (_damage * (0.01 max (1 - (_unit skill "courage"))) * GVAR(thresholdFactor));
        [_unit, (0.1 max (random 0.35))] call ace_medical_fnc_adjustPainLevel;
        _unit setVariable [QGVAR(threshold), _threshold];
    };
    case "taser": {
        private _taserWorked = random 1 <= GVAR(taserWorkChance);
        if (_taserWorked) then {
            _threshold =  _threshold + (_damage * GVAR(thresholdFactor)) + 10;
            private _initPain = _unit getVariable [QEGVAR(medical,pain), 0];
            [_unit, 1] call ace_medical_fnc_adjustPainLevel;
            [_unit, true] call ace_medical_engine_fnc_setUnconsciousAnim;

            if !(currentWeapon _unit isEqualTo "") then {
                [_unit, currentWeapon _unit] call CBA_fnc_dropWeapon;
            };

            _unit setVariable [QGVAR(threshold), _threshold];
            _unit setVariable [QGVAR(taserHappening), true];

            [{
                params ["_unit", "_initPain"];

                if !(local _unit) exitWith {
                    ERROR_1("Unit %1 not local or null",_unit);
                };

                if !(_unit getVariable ["ACE_isUnconscious", false]) then { // Ensure unit didn't go unconscious from injury
                    [_unit, false] call ace_medical_engine_fnc_setUnconsciousAnim;
                };

                _unit setVariable [QGVAR(taserHappening), nil];
                [_unit, (_initPain - 1) + GVAR(taserPain)] call ace_medical_fnc_adjustPainLevel;
            }, [_unit, _initPain], 3] call CBA_fnc_waitAndExecute;
        };
    };
};

// Update unit status
if (isPlayer _unit) then {

} else {
    // Handle Surrendering
    if !(_unit getVariable [QEGVAR(captives,isSurrendering), false]) then {
        private _instantSurrender = (_threshold > 0) && ((_unit skill "courage") <= GVAR(surrenderCourage));
        private _thresholdSurrender = (_threshold >= GVAR(surrenderThreshold)) && (random 1 >= GVAR(surrenderChance));
        private _painSurrender = (isNil {_unit getVariable [QGVAR(taserHappening), nil]}) && ((_unit getVariable [QEGVAR(medical,pain), 0]) >= GVAR(painSurrenderThreshold));

        if (_instantSurrender || _thresholdSurrender || _painSurrender) then {
            [_unit, true] call EFUNC(captives,setSurrendered);
        };
    };
};

nil

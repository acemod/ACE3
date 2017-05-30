/**
 * fn_healLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

params ["_caller", "_target"];

if (alive _target) exitWith {

    _target setVariable [QGVAR(pain), 0, true];
    _target setVariable [QGVAR(morphine), 0, true];
    _target setVariable [QGVAR(bloodVolume), 100, true];

    // tourniquets
    _target setVariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];

    // wounds and injuries
    _target setVariable [QGVAR(openWounds), [], true];
    _target setVariable [QGVAR(bandagedWounds), [], true];
    _target setVariable [QGVAR(internalWounds), [], true];

    // vitals
    _target setVariable [QGVAR(heartRate), 80];
    _target setVariable [QGVAR(heartRateAdjustments), []];
    _target setVariable [QGVAR(bloodPressure), [80, 120]];
    _target setVariable [QGVAR(peripheralResistance), 100];

    // fractures
    _target setVariable [QGVAR(fractures), []];

    // IVs
    _target setVariable [QGVAR(ivBags), nil, true];

    // damage storage
    _target setVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];

    // airway
    _target setVariable [QGVAR(airwayStatus), 100, true];
    _target setVariable [QGVAR(airwayOccluded), false, true];
    _target setVariable [QGVAR(airwayCollapsed), false, true];

    // generic medical admin
    _target setVariable [QGVAR(inCardiacArrest), false, true];
    _target setVariable [QGVAR(inReviveState), false, true];
    _target setVariable ["ACE_isUnconscious", false, true];
    _target setVariable [QGVAR(hasLostBlood), 0, true];
    _target setVariable [QGVAR(isBleeding), false, true];
    _target setVariable [QGVAR(hasPain), false, true];
    _target setVariable [QGVAR(painSuppress), 0, true];

    // medication
    private _allUsedMedication = _target getVariable [QGVAR(allUsedMedication), []];
    {
       _target setVariable [_x select 0, nil];
    } forEach _allUsedMedication;

    // Resetting damage
    _target setDamage 0;

    [_target, "activity", LSTRING(Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
    [_target, "activity_view", LSTRING(Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message
};

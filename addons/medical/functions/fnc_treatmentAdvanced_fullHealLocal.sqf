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

private "_allUsedMedication";
params ["_caller", "_target"];

if (alive _target) exitWith {

    _target setVariable [QGVAR(pain), 0, true];
    _target setVariable [QGVAR(morphine), 0, true];
    _target setVariable [QGVAR(bloodVolume), 100, true];

    // tourniquets
    _target setvariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];

    // wounds and injuries
    _target setvariable [QGVAR(openWounds), [], true];
    _target setvariable [QGVAR(bandagedWounds), [], true];
    _target setVariable [QGVAR(internalWounds), [], true];

    // vitals
    _target setVariable [QGVAR(heartRate), 80];
    _target setvariable [QGVAR(heartRateAdjustments), []];
    _target setvariable [QGVAR(bloodPressure), [80, 120]];
    _target setVariable [QGVAR(peripheralResistance), 100];

    // fractures
    _target setVariable [QGVAR(fractures), []];

    // IVs
    _target setVariable [QGVAR(salineIVVolume), 0];
    _target setVariable [QGVAR(plasmaIVVolume), 0];
    _target setVariable [QGVAR(bloodIVVolume), 0];

    // damage storage
    _target setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];

    // airway
    _target setvariable [QGVAR(airwayStatus), 100, true];
    _target setVariable [QGVAR(airwayOccluded), false, true];
    _target setvariable [QGVAR(airwayCollapsed), false, true];

    // generic medical admin
    _target setvariable [QGVAR(addedToUnitLoop), false, true];
    _target setvariable [QGVAR(inCardiacArrest), false, true];
    _target setvariable [QGVAR(inReviveState), false, true];
    _target setVariable ["ACE_isUnconscious", false, true];
    _target setvariable [QGVAR(hasLostBlood), 0, true];
    _target setvariable [QGVAR(isBleeding), false, true];
    _target setvariable [QGVAR(hasPain), false, true];
    _target setvariable [QGVAR(painSuppress), 0, true];

    // medication
    _allUsedMedication = _target getVariable [QGVAR(allUsedMedication), []];
    {
       _target setvariable [_x select 0, nil];
    } foreach _allUsedMedication;

    // Resetting damage
    _target setDamage 0;

    [_target, "activity", LSTRING(Activity_fullHeal), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
    [_target, "activity_view", LSTRING(Activity_fullHeal), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message
};

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

private ["_target", "_caller", "_allUsedMedication"];
_caller = _this select 0;
_target = _this select 1;

if (alive _target) exitwith {

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
    [_target, QGVAR(leftLegDamage), false] call EFUNC(common,setForceWalkStatus);
    [_target, QGVAR(rightLegDamage), false] call EFUNC(common,setForceWalkStatus);

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
    }foreach _allUsedMedication;

    // Resetting damage
    _target setDamage 0;
};

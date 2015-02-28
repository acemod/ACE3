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

private ["_unit", "_caller"];
_unit = _this select 0;
_caller = _this select 1;

if (alive _unit) exitwith {

    _unit setVariable [QGVAR(pain), 0, true];
    _unit setVariable [QGVAR(morphine), 0, true];
    _unit setVariable [QGVAR(bloodVolume), 100, true];

    // tourniquets
    _unit setvariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];

    // wounds and injuries
    _unit setvariable [QGVAR(openWounds), [], true];
    _unit setVariable [QGVAR(internalWounds), [], true];

    // vitals
    _unit setVariable [QGVAR(heartRate), 80];
    _unit setvariable [QGVAR(heartRateAdjustments), []];
    _unit setvariable [QGVAR(bloodPressure), _bloodPressure];
    _unit setVariable [QGVAR(peripheralResistance), 100];

    // fractures
    _unit setVariable [QGVAR(fractures), []];

    // IVs
    _unit setVariable [QGVAR(salineIVVolume), 0];
    _unit setVariable [QGVAR(plasmaIVVolume), 0];
    _unit setVariable [QGVAR(bloodIVVolume), 0];

    // damage storage
    _unit setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];

    // airway
    _unit setvariable [QGVAR(airwayStatus), 0, true];
    _unit setVariable [QGVAR(airwayOccluded), false, true];
    _unit setvariable [QGVAR(airwayCollapsed), true, true];

    // generic medical admin
    _unit setvariable [QGVAR(addedToUnitLoop), false, true];
    _unit setvariable [QGVAR(inCardiacArrest), true,true];
    _unit setVariable [QGVAR(isUnconscious), false, true]
    _unit setvariable [QGVAR(hasLostBlood), true, true];
    _unit setvariable [QGVAR(isBleeding), false, true];
    _unit setvariable [QGVAR(hasPain), false, true];

    // medication
    _allUsedMedication = _target getVariable [QGVAR(allUsedMedication), []];
    {
       _unit setvariable [_x select 0, nil];
    }foreach _allUsedMedication;

    // Resetting damage
    _unit setDamage 0;
    ["Medical_onFullyHealed", [_unit, true]] call ace_common_fnc_localEvent;
    [format["Completed healLocal %1", _this]] call EFUNC(common,debug);
};

["Medical_onFullyHealed", [_unit, false]] call ace_common_fnc_localEvent;
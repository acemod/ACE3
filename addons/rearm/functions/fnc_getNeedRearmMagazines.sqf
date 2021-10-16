#include "script_component.hpp"
/*
 * Author: Tuupertunut
 * Returns information about every magazine that can be rearmed in the vehicle. Multiple mags of
 * same class in the same turret are grouped together for practical reasons.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Magazine info <ARRAY of ARRAYs>
 * Child arrays:
 *   0: Magazine class <STRING>
 *   1: Turret path <ARRAY>
 *   2: Is pylon magazine <BOOLEAN>
 *   3: Pylon index (-1 if not pylon) <NUMBER>
 *   4: Max magazines <NUMBER>
 *   5: Current magazines <NUMBER>
 *   6: Max rounds per magazine <NUMBER>
 *   7: Current rounds in magazines <ARRAY of NUMBERs>
 *
 * Example:
 * [tank] call ace_rearm_fnc_getNeedRearmMagazines
 *
 * Public: No
 */

params ["_vehicle"];

private _magazineInfo = [];

// 1.70 pylons
private _pylonConfigs = configProperties [configOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
{
    private _pylonConfig = _x;

    // Strangely, a 1-based index.
    private _pylonIndex = _forEachIndex + 1;

    // Retrieving pylon magazine by index. If the pylon is empty, it is marked with "".
    private _pylonMagazine = (getPylonMagazines _vehicle) select (_pylonIndex - 1);

    // Only care about pylons that have a magazine.
    if (_pylonMagazine isNotEqualTo "") then {

        private _maxRounds = getNumber (configFile >> "CfgMagazines" >> _pylonMagazine >> "count");
        private _currentRounds = _vehicle ammoOnPylon _pylonIndex;

        if (_currentRounds < _maxRounds) then {
            // getPylonTurret expects 0 based index, and returns driver turret as [-1]
            private _pylonTurret = [_vehicle, _forEachIndex] call EFUNC(common,getPylonTurret);

            _magazineInfo pushBack [_pylonMagazine, _pylonTurret, true, _pylonIndex, 1, 1, _maxRounds, [_currentRounds]];
        };
    };
} forEach _pylonConfigs;

private _turrets = [_vehicle] call FUNC(getAllRearmTurrets);
{
    private _turretPath = _x;
    private _magazineClasses = [];

    if (_vehicle getVariable [QGVAR(scriptedLoadout), false]) then {
        {
            _x params ["_className", "_turretCurrent"];
            if (_turretPath isEqualTo _turretCurrent) then {
                _magazineClasses pushBackUnique _className;
            };
        } forEach (magazinesAllTurrets _vehicle); 
    } else {
        _magazineClasses = [_vehicle, _turretPath] call FUNC(getTurretConfigMagazines);
        _magazineClasses = _magazineClasses arrayIntersect _magazineClasses;
    };

    {
        private _magazineClass = _x;

        private _maxMagazines = [_vehicle, _turretPath, _magazineClass] call FUNC(getMaxMagazines);
        private _maxRoundsPerMag = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count");

        /* Array of ammo counts in every magazine. Example: [200, 200, 152] means 2 mags with 200
         * rounds and 1 mag with 152 rounds. */
        private _currentRounds = [_vehicle, _turretPath, _magazineClass] call FUNC(getTurretMagazineAmmo);
        private _currentMagazines = count _currentRounds;

        /* If there is space for new magazines or if some magazines are not full, add the magazine
         * type to _magazineInfo. */
        if ((_currentMagazines < _maxMagazines) || {({_x < _maxRoundsPerMag} count _currentRounds) > 0}) then {
            if (_magazineClass == "FakeWeapon") exitWith {};
            _magazineInfo pushBack [_magazineClass, _turretPath, false, -1, _maxMagazines, _currentMagazines, _maxRoundsPerMag, _currentRounds];
        };

    } forEach _magazineClasses;
} forEach _turrets;

TRACE_2("getNeedRearmMagazines",_vehicle,_magazineInfo);
_magazineInfo

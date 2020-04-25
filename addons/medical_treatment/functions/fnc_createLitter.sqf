#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Creates litter around the patient based on the treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Head", "BasicBandage"] call ace_medical_treatment_fnc_createLitter
 *
 * Public: No
 */

// Exit if litter creation is disabled
if (!GVAR(allowLitterCreation)) exitWith {};

params ["_medic", "_patient", "_bodyPart", "_classname"];

// Don't create litter if medic or patient are inside a vehicle
if (vehicle _medic != _medic || {vehicle _patient != _patient}) exitWith {};

// Determine if treated body part is bleeding
private _index = ALL_BODY_PARTS find toLower _bodyPart;
private _isBleeding = GET_OPEN_WOUNDS(_patient) findIf {
    _x params ["", "_bodyPartN", "_amountOf", "_bleeding"];

    _bodyPartN == _index && {_amountOf * _bleeding > 0}
} != -1;

// Get litter config for the treatment
private _litter = getArray (configFile >> QGVAR(actions) >> _classname >> "litter");
_litter params [["_alwaysLitter", [], [[]]], ["_cleanLitter", [], [[]]], ["_bloodyLitter", [], [[]]]];

private _fnc_createLitter = {
    params ["_litterOptions"];

    private _position = getPosASL _patient;

    // For now, don't spawn litter over water to avoid floating litter
    // todo: handle carriers over water
    if (surfaceIsWater _position) exitWith {};

    {
        if (_x isEqualType []) then {
            _x = selectRandom _x;
        };

        // Randomize position XY +/- 1 m
        private _position = _position vectorAdd [
            random 2 - 1,
            random 2 - 1,
            0
        ];

        // Create litter on server which will also handle cleanup
        [QGVAR(createLitterServer), [_x, _position, random 360]] call CBA_fnc_serverEvent;
    } forEach _litterOptions;
};

private _conditionalLitter = [_cleanLitter, _bloodyLitter] select _isBleeding;

[_alwaysLitter] call _fnc_createLitter;
[_conditionalLitter] call _fnc_createLitter;

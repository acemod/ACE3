#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Prevents bandage actions from showing if selected body part isn't bleeding.
 * Toggles between showing all or only basic bandage action for advanced setting.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Can Bandage <BOOL>
 *
 * Example:
 * [player, cursorTarget, "Head", "FieldDressing"] call ace_medical_treatment_fnc_canBandage
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_bandage"];

// Bandage type and bandage setting XNOR to show only active actions
if ((_bandage == "BasicBandage") isEqualTo (GVAR(advancedBandages) != 0)) exitWith {false};

private _index = ALL_BODY_PARTS find toLower _bodyPart;
private _canBandage = false;

{
    _x params ["", "_bodyPartN", "_amountOf", "_bleeding"];

    // If any single wound on the bodypart is bleeding bandaging can go ahead
    if (_bodyPartN == _index && {_amountOf * _bleeding > 0}) exitWith {
        _canBandage = true;
    };
} forEach GET_OPEN_WOUNDS(_patient);

_canBandage

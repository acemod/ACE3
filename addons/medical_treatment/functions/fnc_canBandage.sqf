#include "..\script_component.hpp"
/*
 * Author: kymckay
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
_bodyPart = toLowerANSI _bodyPart;

// If patient is swimming, don't allow bandage actions.
if (_patient call EFUNC(common,isSwimming)) exitWith {false};

// Bandage type and bandage setting XNOR to show only active actions
if ((_bandage == "BasicBandage") isEqualTo (GVAR(advancedBandages) != 0)) exitWith {false};

private _canBandage = false;

{
    _x params ["", "_amountOf", "_bleeding"];

    // If any single wound on the bodypart is bleeding bandaging can go ahead
    if (_amountOf * _bleeding > 0) exitWith {
        _canBandage = true;
    };
} forEach ((GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []]);

_canBandage

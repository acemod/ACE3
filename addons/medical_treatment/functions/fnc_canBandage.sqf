#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Prevents bandage actions from showing if selected body part isn't bleeding.
 * Toggles between showing all or only basic bandage action for advanced setting.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * ReturnValue:
 * Can Bandage <BOOL>
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodypart", "_bandage"];

// Bandage type and bandage setting XNOR to show only active actions
if ((_bandage == "BasicBandage") isEqualTo GVAR(advancedBandages)) exitWith { false };

private _index = ALL_BODY_PARTS find toLower _bodypart;
private _canBandage = false;

{
    _x params ["", "", "_bodyPartN", "_amountOf", "_bleeding"];

    // If any single wound on the bodypart is bleeding bandaging can go ahead
    if (_bodyPartN == _index && {_amountOf * _bleeding > 0}) exitWith {
        _canBandage = true;
    };
} forEach (_patient getVariable [QEGVAR(medical,openWounds), []]);

_canBandage

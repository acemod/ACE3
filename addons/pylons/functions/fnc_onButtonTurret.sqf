#include "script_component.hpp"
/*
 * Author: 654wak654
 * Handles init and click events of turret switch buttons.
 *
 * Arguments:
 * 0: Button <CONTROL>
 * 1: Should switch icons <BOOL>
 * 2: Turret path <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_button, true, []] call ace_pylons_fnc_onButtonTurret
 *
 * Public: No
 */

params ["_ctrl", "_switch", "_turret"];

if (_switch) then {
    _turret = [[0], [-1]] select ((_ctrl getVariable QGVAR(turret)) isEqualTo [0]);

    {
        _x params ["", "_mirroredIndex", "_button"];
        if (_ctrl == _button) exitWith {
            if (_mirroredIndex == -1) then {
                private _indexOf = _forEachIndex;
                {
                    _x params ["", "_mirroredIndex", "_button"];
                    if (_mirroredIndex == _indexOf && {!ctrlEnabled _button}) exitWith {
                        [_button, false, _turret] call FUNC(onButtonTurret);
                    };
                } forEach GVAR(comboBoxes);
            };
        };
    } forEach GVAR(comboBoxes);
};
_ctrl setVariable [QGVAR(turret), _turret];

if (_turret isEqualTo [-1]) then {
    _ctrl ctrlSetText "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa";
    _ctrl ctrlSetTooltip localize "str_driver";
} else {
    _ctrl ctrlSetText "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa";
    _ctrl ctrlSetTooltip localize "str_gunner";
};

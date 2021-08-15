#include "script_component.hpp"
/*
 * Author: veteran29
 * Handles visual changes of the speed indicator.
 *
 * Arguments:
 * Percent of stamina remaining <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [4] call ace_advanced_fatigue_fnc_handleSpeedIndicator
 *
 * Public: No
 */

// TODO GVAR on preInit
private _hash = createHashMapFromArray [
    // Standing/Crouched
    [["wlk", false], QPATHTOF(ui\speed_indicator\1_ca.paa)],
    [["tac", false], QPATHTOF(ui\speed_indicator\2_ca.paa)],
    [["run", false], QPATHTOF(ui\speed_indicator\3_ca.paa)],
    [["eva", false], QPATHTOF(ui\speed_indicator\4_ca.paa)],
    // Prone
    [["run", true], QPATHTOF(ui\speed_indicator\2_ca.paa)],
    [["spr", true], QPATHTOF(ui\speed_indicator\3_ca.paa)],
    [["eva", true], QPATHTOF(ui\speed_indicator\4_ca.paa)]
];

private _animSpeed = GVAR(animState) select [9, 3];
private _icon = _hash getOrDefault [[_animSpeed, GVAR(isProne)], ""];

systemChat str [_icon];

private _speedIndicator = uiNamespace getVariable [QGVAR(speedIndicator), controlNull];
_speedIndicator ctrlSetText _icon;

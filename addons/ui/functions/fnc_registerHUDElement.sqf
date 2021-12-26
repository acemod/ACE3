#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Registers a HUD element for the HUD helper. Called from onLoad control event handler.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Control Config <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrl] call ace_ui_fnc_registerHUDElement
 *
 * Public: No
 */
params [["_ctrl", controlNull, [controlNull]], ["_config", configNull, [configNull]]];
if (isNull _ctrl) exitWith {};

private _id = ctrlClassName _ctrl;
private _condition = getText (_config >> "condition");
if (_condition != "") then {
    _condition = missionNamespace getVariable [_condition, compile _condition];
} else {
    _condition = {true};
};

uiNamespace setVariable [_id, _ctrl];
GVAR(hudHelperHash) set [_id, _condition];

private _info = format ["Addon %1 registered HUD element with id: %2", (configSourceAddonList _config) select 0, _id];

INFO(_info);

/*
 * Author: commy2
 * Applies buttons
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Example:
 * call ace_interaction_fnc_applyButtons
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_object", "_actions", "_dlgInteractionDialog", "_ctrlInteractionDialog", "_index", "_ctrlInteractionDialogIcon", "_a", "_action", "_count"];

_object = GVAR(Target);
_actions = GVAR(Buttons);


disableSerialization;
_dlgInteractionDialog = uiNamespace getVariable QGVAR(Dialog);

/*
for "_a" from 0 to (_count - 1) do {
    _action = GVAR(Buttons) select _a;

    _ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _a);
    _ctrlInteractionDialog ctrlShow true;
    _ctrlInteractionDialog ctrlSetText (_action select 0);
    _ctrlInteractionDialog ctrlEnable (call (_action select 2));
};
*/

_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl 3;

GVAR(MainButton) = "(findDisplay 1713999) closeDisplay 1;";

if (_object isKindOf "Man") then {
    _ctrlInteractionDialog ctrlSetText (if (alive _object) then {name _object} else {_object getVariable ["ACE_Name", "Unknown"]});
} else {
    _ctrlInteractionDialog ctrlSetText (getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName"));
};

for "_index" from 0 to 9 do {
    _ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _index);
    _ctrlInteractionDialog ctrlShow true;

    _ctrlInteractionDialogIcon = _dlgInteractionDialog displayCtrl (20 + _index);

    if (_index < _count) then {
        _action = GVAR(Buttons) select _index;
        _action params ["_text", "", "_condition", "", "", "_icon"];
        _ctrlInteractionDialog ctrlSetText _text;
        _ctrlInteractionDialog ctrlEnable (call _condition);

        _ctrlInteractionDialogIcon ctrlSetText _icon;
    } else {
        _ctrlInteractionDialog ctrlSetText "";
        _ctrlInteractionDialog ctrlEnable false;

        _ctrlInteractionDialogIcon ctrlSetText "";
    };
};

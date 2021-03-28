#include "script_component.hpp"
/*
 * Author: mharis001
 * Updates the triage card for the given target.
 *
 * Arguments:
 * 0: Triage list <CONTROL>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrlTriage, _target] call ace_medical_gui_fnc_updateTriageCard
 *
 * Public: No
 */

params ["_ctrl", "_target"];

private _triageCard = _target getVariable [QEGVAR(medical,triageCard), []];
lbClear _ctrl;

{
    _x params ["_item", "_amount", "_time"];

    // Check for item displayName or localized text
    if (isClass (configFile >> "CfgWeapons" >> _item)) then {
        _item = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
    } else {
        if (isLocalized _item) then {
            _item = localize _item;
        };
    };

    // Convert time to minutes ago
    _time = round ((CBA_missionTime - _time) / 60);

    _ctrl lbAdd format ["%1x - %2 (%3m)", _amount, _item, _time];
} forEach _triageCard;

// Handle no triage card entries
if (lbSize _ctrl == 0) then {
    _ctrl lbAdd localize ELSTRING(medical_treatment,TriageCard_NoEntry);
};

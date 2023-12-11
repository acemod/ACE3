#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Export current loadout / default loadouts list to clipboard.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display"];

if (GVAR(shiftState)) then {
    if (isNil QGVAR(defaultLoadoutsList) || {GVAR(defaultLoadoutsList) isEqualTo []}) exitWith {
        [_display, LLSTRING(exportDefaultError)] call FUNC(message);
    };

    // Export default loadout list
    private _listLength = count GVAR(defaultLoadoutsList);

    for "_index" from -1 to _listLength do {
        switch (true) do {
            // Beginning
            case (_index == -1): {
                "ace_clipboard" callExtension (format ["[%1", endl]);
            };
            // End
            case (_index == _listLength): {
                "ace_clipboard" callExtension "];";
            };
            // Rest
            default {
                "ace_clipboard" callExtension (["    ", str (GVAR(defaultLoadoutsList) select _index), [",", ""] select (_index == _listLength - 1), endl] joinString "");
            };
        };
    };

    "ace_clipboard" callExtension "--COMPLETE--";

    [_display, LLSTRING(exportDefault)] call FUNC(message);
} else {
    // Export singular loadout
    private _export = str (GVAR(center) call CBA_fnc_getLoadout);

    "ace_clipboard" callExtension (_export + ";");
    "ace_clipboard" callExtension "--COMPLETE--";

    [_display, LLSTRING(exportCurrent)] call FUNC(message);
};

[QGVAR(loadoutExported), [_display, GVAR(shiftState)]] call CBA_fnc_localEvent;

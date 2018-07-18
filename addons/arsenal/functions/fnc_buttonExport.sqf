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
#include "script_component.hpp"

params ["_display"];

if (GVAR(shiftState)) then {

    if (isNil QGVAR(defaultLoadoutsList) || {GVAR(defaultLoadoutsList) isEqualTo []}) exitWith {
        [_display, localize LSTRING(exportDefaultError)] call FUNC(message);
    };

    private _listLength = count GVAR(defaultLoadoutsList);
    for "_index" from -1 to _listLength do {

        switch true do {
            case (_index == -1): {
                "ace_clipboard" callExtension (format ["[%1", endl]);
            };

            case (_index == _listLength): {
                "ace_clipboard" callExtension "];";
            };

            default {
                "ace_clipboard" callExtension (["    ",str (GVAR(defaultLoadoutsList) select _index), [",", ""] select (_index == _listLength - 1), endl] joinString "");
            };
        };
    };

    "ace_clipboard" callExtension "--COMPLETE--";

    [_display, localize LSTRING(exportDefault)] call FUNC(message);
} else {

    private _export = str getUnitLoadout GVAR(center);
    "ace_clipboard" callExtension (_export + ";");
    "ace_clipboard" callExtension "--COMPLETE--";

    [_display, localize LSTRING(exportCurrent)] call FUNC(message);
};

[QGVAR(loadoutExported), [_display, GVAR(shiftState)]] call CBA_fnc_localEvent;

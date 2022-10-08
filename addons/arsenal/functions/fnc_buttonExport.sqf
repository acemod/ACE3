#include "script_component.hpp"
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
        [_display, localize LSTRING(exportDefaultError)] call FUNC(message);
    };

    private _listLength = count GVAR(defaultLoadoutsList);
    for "_index" from -1 to _listLength do {

        switch true do {
            case (_index == -1): {
                "ace" callExtension ["clipboard:append", [(format ["[%1", endl])]];
            };

            case (_index == _listLength): {
                "ace" callExtension ["clipboard:append", ["];"]];
            };

            default {
                "ace" callExtension ["clipboard:append", [(["    ",str (GVAR(defaultLoadoutsList) select _index), [",", ""] select (_index == _listLength - 1), endl] joinString "")]];
            };
        };
    };

    "ace" callExtension ["clipboard:complete", []];

    [_display, localize LSTRING(exportDefault)] call FUNC(message);
} else {

    private _export = str ([GVAR(center)] call FUNC(getLoadout));
    "ace" callExtension ["clipboard:append", [_export]];
    "ace" callExtension ["clipboard:complete", []];

    [_display, localize LSTRING(exportCurrent)] call FUNC(message);
};

[QGVAR(loadoutExported), [_display, GVAR(shiftState)]] call CBA_fnc_localEvent;

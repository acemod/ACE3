#include "script_component.hpp"

params ["_display"];

if (GVAR(shiftState)) then {

    if (isNil QGVAR(defaultLoadoutsList) || {GVAR(defaultLoadoutsList) isEqualTo []}) exitWIth {
        [_display, "Default loadouts list is empty"] call FUNC(message);
    };

    private _listLength = count GVAR(defaultLoadoutsList);
    for "_index" from -1 to _listLength do {

        switch true do {
            case (_index == -1): {
                "ace_clipboard" callExtension (format ["GVAR(defaultLoadoutsList) = [%1", endl]);
            };

            case (_index == _listLength): {
                "ace_clipboard" callExtension "];;";
            };

            default {
                "ace_clipboard" callExtension (["    ",str (GVAR(defaultLoadoutsList) select _index), [",", ""] select (_index == _listLength - 1), endl] joinString "");
            };
        };
    };

    "ace_clipboard" callExtension "--COMPLETE--";

    [_display, "Default loadouts list exported to clipboard"] call FUNC(message);
} else {

    private _export = str getUnitLoadout GVAR(center);
    "ace_clipboard" callExtension (_export + ";");
    "ace_clipboard" callExtension "--COMPLETE--";

    [_display, "Current loadout exported to clipboard"] call FUNC(message);
};

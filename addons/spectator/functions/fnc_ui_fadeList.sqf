/*
 * Author: Nelson Duarte, AACO
 * Function used to fade/unfade the entitiy list
 *
 * Arguments:
 * 0: Fade the list <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_spectator_fnc_ui_fadeList
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_fadeList"];

if (GVAR(uiVisible)) then {
    private _list = CTRL_LIST;
    private _tabs = CTRL_TABS;

    if (_fadeList) then {
        _list ctrlSetBackgroundColor [0,0,0,0];
        _list ctrlSetFade 0.8;

        _tabs ctrlSetBackgroundColor [0,0,0,0];
        _tabs ctrlSetFade 0.5;

        ctrlSetFocus CTRL_MOUSE;

        showChat true;
    } else {
        _list ctrlSetBackgroundColor [0,0,0,0.75];
        _list ctrlSetFade 0;

        _tabs ctrlSetBackgroundColor [0,0,0,0.25];
        _tabs ctrlSetFade 0;

        ctrlSetFocus _list;

        // List overlaps with chat
        showChat false;
    };

    _list ctrlCommit 0.2;
    _tabs ctrlCommit 0.2;
};

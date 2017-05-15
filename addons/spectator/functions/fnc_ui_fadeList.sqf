/*
 * Author: Nelson Duarte, AACO
 * Function used to fade/unfade the entitiy/location list
 *
 * Public: No
 */

#include "script_component.hpp"
TRACE_1("Params",_this);
disableSerialization;

params ["_fadeList"];

if (GVAR(uiVisible)) then {
    private _list = CTRL_LIST;

    if (_fadeList) then {
        _list ctrlSetBackgroundColor [0,0,0,0];
        _list ctrlSetFade 0.8;
        ctrlSetFocus CTRL_MOUSE;

        // if (GVAR(camMode) == MODE_FREE) then {
        //     GVAR(camera) camCommand "manual on";
        // };

        showChat true;
    } else {
        _list ctrlSetBackgroundColor [0,0,0,0.75];
        _list ctrlSetFade 0.0;
        ctrlSetFocus _list;

        // Disable camera input while using the list
        // GVAR(camera) camCommand "manual off";

        // List overlaps with chat
        showChat false;
    };

    _list ctrlCommit 0.2;
};

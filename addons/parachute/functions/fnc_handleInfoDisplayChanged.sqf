/*
 * Author: commy2
 * Hides the height and velocity display while freefalling or parachuting on higher difficulties.
 *
 * Arguments:
 * Stuff from infoDisplayChanged eventhandler. <UNKNOWN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [?] call ACE_parachute_fnc_handleInfoDisplayChanged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_dialog", "_type"];

// don't do anything in noob mode
if (cadetMode) exitWith {};

switch (_type) do {
    case ("Parachute"): {
        {
            (_dialog displayCtrl _x) ctrlShow false;
        } forEach [121, 122, 1004, 1005, 1006, 1014];
    };

    case ("Soldier"): {
        {
            private _control = (_dialog displayCtrl _x);

            // these reset ctrlShow every frame by the engine. Set height/width to 0 as work around.
            _control ctrlSetPosition [0,0,0,0];
            _control ctrlCommit 0;
        } forEach [380, 382];
    };
};
nil // switch might return true if no case was found. Just to make sure the return value matches

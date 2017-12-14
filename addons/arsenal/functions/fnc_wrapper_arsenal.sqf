/*
 * Author: Dystopian
 * Wrapper for BIS_fnc_arsenal.
 *
 * Arguments:
 * 0: Mode <STRING> (default: "Open")
 * 1: Params <ANY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Open", true] call ace_arsenal_fnc_wrapper_arsenal
 *
 * Public: No
*/
#include "script_component.hpp"

// if use just GVAR here, "Undefined variable" error occurs
if !(missionNamespace getVariable QGVAR(replaceBIS)) exitWith {_this call BIS_fnc_arsenalBIS};

params [["_mode", "Open", [""]], ["_params", []]];
TRACE_2("",_mode,_params);

switch _mode do {
    case "Open": {
        _params params [["_full", false, [false]], ["_box", ACE_player, [objNull]], ["_center", ACE_player, [objNull]]];
        [_box, _center, _full] call FUNC(openBox);
    };
    case "AmmoboxInit": {
        _params params [["_box", objNull, [objNull]], ["_full", false, [false]], ["_condition", {true}, [{}]]];
        private _interactionCondition = if (_condition isEqualTo {true}) then {
            {true}
        } else {
            _box setVariable [QGVAR(wrapperCondition), _condition];
            {_player call (_target getVariable QGVAR(wrapperCondition))}
        };
        [_box, _full, true, _interactionCondition] call FUNC(initBox);
    };
    case "AmmoboxExit": {
        _params call FUNC(removeBox);
    };
};

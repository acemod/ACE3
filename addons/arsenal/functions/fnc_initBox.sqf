#include "script_component.hpp"
#include "..\defines.hpp"

params [["_object", objNull, [objNull]], ["_mode", 1, [1]], ["_items", true, [[], true]], ["_global", true, [true]]];

if (_object isEqualTo objNull) exitWith {};

if (_global) then {
    [QGVAR(initBox), [_object, _mode, _items, false]] call CBA_fnc_globalEventJIP;  
} else {
    if ({(_x select 0) select 0 isEqualTo QGVAR(interaction)} count (_object getVariable [QEGVAR(interact_menu,actions), []]) == 0) then {

        private _action = [QGVAR(interaction), "arsenal", "", {
            params ["_target", "_player", "_params"];
            _params params ["_mode"];

            [{[_this select 0, _this select 1] call FUNC(openBox)}, [_mode, _target]] call CBA_fnc_execNextFrame;
        }, 
        {
            params ["_target", "_player"];
            
            [_player, _target, ["isNotSwimming", "isNotCarrying", "isNotDragging", "notOnMap", "isNotEscorting", "isNotOnLadder"]] call EFUNC(common,canInteractWith)
        }, {},[_mode]] call EFUNC(interact_menu,createAction);
        [_object, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToObject);

        [_object, [_items, [_items]] select (typeName _items isEqualTo "ARRAY"), false] call FUNC(addVirtualItems);
    };
};


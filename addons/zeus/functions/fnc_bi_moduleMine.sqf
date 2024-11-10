#include "..\script_component.hpp"
/*
 * Author: Bohemia Interactive
 * Module function for spawning mines
 * Edited to remove forced map markers and mines being revealed to players
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_bi_moduleMine
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];
// IGNORE_PRIVATE_WARNING["_explosive", "_side"];

if (_activated) then {
    _explosive = getText (configOf _logic >> "explosive");
    if (_explosive != "") then {
        _explosive = createVehicle [_explosive,position _logic,[],0,"none"];
        _explosive attachTo [_logic];

        // Added by ace_zeus to control if mines are revealed
        if (GVAR(revealMines) > MINE_REVEAL_NONE) then {
            //--- Reveal the mine to curator's side
            {
                _side = (getAssignedCuratorUnit _x) call bis_fnc_objectSide;
                _side revealMine _explosive;
            } forEach (objectCurators _logic);

            if (GVAR(revealMines) == MINE_REVEAL_FULL) then {
                //--- Mark minefields in the map
                [] spawn bis_fnc_drawMinefields;
            };
        };

        //--- Show hint to curator who placed the object
        [[["Curator","PlaceMines"],nil,nil,nil,nil,nil,nil,true],"bis_fnc_advHint",_logic] call bis_fnc_mp;

        waitUntil {sleep 0.1; isNull _explosive || isNull _logic || !alive _logic};
        if (isNull _logic) then {deleteVehicle _explosive;} else {_explosive setDamage 1;};
        deleteVehicle _logic;
    };
};

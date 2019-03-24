#include "script_component.hpp"
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

if (_activated) then {
    _explosive = gettext (configfile >> "cfgvehicles" >> typeof _logic >> "explosive");
    if (_explosive != "") then {
        _explosive = createvehicle [_explosive,position _logic,[],0,"none"];
        _explosive attachto [_logic];

        // Added by ace_zeus to control if mines are revealed
        if (GVAR(revealMines) > 0) then {
            //--- Reveal the mine to curator's side
            {
                _side = (getassignedcuratorunit _x) call bis_fnc_objectSide;
                _side revealmine _explosive;
            } forEach (objectcurators _logic);

            if (GVAR(revealMines) > 1) then {
                //--- Mark minefields in the map
                [] spawn bis_fnc_drawMinefields;
            };
        };

        //--- Show hint to curator who placed the object
        [[["Curator","PlaceMines"],nil,nil,nil,nil,nil,nil,true],"bis_fnc_advHint",_logic] call bis_fnc_mp;

        waituntil {sleep 0.1; isnull _explosive || isnull _logic || !alive _logic};
        if (isnull _logic) then {deletevehicle _explosive;} else {_explosive setdamage 1;};
        deletevehicle _logic;
    };
};

/*
    File Name: fnc_refill.sqf
    Author: Jak Keen
*/

#include "script_component.hpp"

params["_target", "_player", "_mode"];

switch (_mode) do {
    case 0: {
        {
            if (_x in (items player)) exitwith {
                private _item = getText(configFile >> "CfgWeapons" >> _x >> QGVAR(onFill));
                player removeItem _x;
                player addItem _item;
            };
        } forEach GVAR(refill_items);
    };

    case 1: {
        if(count (nearestObjects [player, GVAR(refill_sources), 2]) > 0) exitwith {
            GVAR(camelbak) = 100;
        };

        {
            if (_x in (items player)) exitwith {
                private _item = getText(configFile >> "CfgWeapons" >> _x >> QGVAR(onDrink));
                player removeItem _x;
                player addItem _item;

                GVAR(camelbak) = GVAR(camelbak) + 25;

                if(GVAR(camelbak) > 100) then {
                    GVAR(camelbak) = 100;
                };
            };
        } forEach GVAR(drink_items);
    };

    // If camelbak on and water is below 100
    case 2: {
        private _amount = 100 - GVAR(water);

        if((GVAR(camelbak) - _amount) >= 0) then {
            GVAR(water) = 100;
            GVAR(camelbak) = GVAR(camelbak) - _amount;
        };
    };

    default {
        hint "Error no refill mode selected";
    };
};
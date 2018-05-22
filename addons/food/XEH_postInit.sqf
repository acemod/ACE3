#include "script_component.hpp"

if (!GVAR(enable)) exitWith {};
if (!hasInterface) exitwith {};

// Set vars
GVAR(food) = 100;
GVAR(water) = 100;
GVAR(camelbak) = 0;

GVAR(food_items) = ["ACE_MRE_Type1", "ACE_MRE_Type2"];
GVAR(drink_items) = ["ACE_Waterbottle_Part", "ACE_Waterbottle_Full"];
GVAR(refill_items) = ["ACE_Waterbottle_Empty", "ACE_Waterbottle_Part"];
GVAR(camelbak_item) = "ACE_Camelbak";
GVAR(refill_sources) = ["Land_BarrelWater_F"];

// Init player HUD
if(GVAR(enableHUD)) then {
    101 cutRsc ["ACE_FoodStats","PLAIN"];
    [{call FUNC(updatePlayerHud)}, 1, []] call CBA_fnc_addPerFrameHandler;
};

["CBA_SettingChanged", {
    if(GVAR(enableHUD)) then {
        101 cutRsc ["ACE_FoodStats","PLAIN"];
        private _handle = [{call FUNC(updatePlayerHud)}, 1, []] call CBA_fnc_addPerFrameHandler;
    } else {
        if(!isNil "_handle") then {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
        101 cutRsc ["","PLAIN"];
    };
}] call CBA_fnc_addEventHandler;

// Add eat/drink actions
[] call FUNC(addActions);

// Init reduction of stats
[{
    if (alive player) then {
        [player] call FUNC(reduceStats);
    };
}, 5, []] call CBA_fnc_addPerFrameHandler;

// Inventory event handler
["loadout", {[] call FUNC(onCloseInventory)}] call CBA_fnc_addPlayerEventHandler;
#include "script_component.hpp"

if (!GVAR(enable)) exitWith {};
if (!hasInterface) exitwith {};

// Set vars
GVAR(food) = 100;
GVAR(water) = 100;
GVAR(camelbak) = 0;

GVAR(food_decent_rate) = 0.02;
GVAR(water_decent_rate) = 0.025;

GVAR(food_items) = ["ACE_MRE_Type1", "ACE_MRE_Type2"];
GVAR(drink_items) = ["ACE_Waterbottle_Part", "ACE_Waterbottle_Full"];
GVAR(refill_items) = ["ACE_Waterbottle_Empty", "ACE_Waterbottle_Part"];
GVAR(camelbak_item) = "ACE_Camelbak";
GVAR(refill_sources) = ["Land_BarrelWater_F"];

GVAR(inventory) = [];

// Init player HUD
101 cutRsc ["ACE_FoodStats","PLAIN"];

// Call update loop file
[{call FUNC(updatePlayerHud)}, 1, []] call CBA_fnc_addPerFrameHandler;

// Add eat/drink actions
[] call FUNC(addActions);

// Init reduction of stats
["itemAdd", ["ACE_FoodStats_Loop", {
    if (alive player) then {
        [player] call FUNC(reduceStats);
    };
}, 4]] call BIS_fnc_loop;

// Inventory event handler
[player, "InventoryClosed", {
    [] call FUNC(onCloseInventory);
}] call CBA_fnc_addBISEventHandler;
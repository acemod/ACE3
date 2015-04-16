// by commy2

// The Arma InventoryOpened EH fires actually before the inventory dialog is opened (findDisplay 602 => displayNull).

#include "script_component.hpp"

["inventoryDisplayLoaded",{
    [ACE_player] call FUNC(takeLoadedATWeapon);
    [ACE_player, (_this select 0)] call FUNC(updateInventoryDisplay);
}] call EFUNC(common,addEventHandler);
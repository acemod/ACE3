// by commy2

// The Arma InventoryOpened EH fires actually before the inventory dialog is opened (findDisplay 602 => displayNull).

#include "script_component.hpp"

if (isNil QGVAR(UpdateInventoryDisplay_EHID)) then {
  GVAR(UpdateInventoryDisplay_EHID) = ["inventoryDisplayLoaded",{
    _player = ACE_player;
    [_player, secondaryWeapon _player] call FUNC(takeLoadedATWeapon);
    [_player, (_this select 0)] call FUNC(updateInventoryDisplay);
  }] call EFUNC(common,addEventHandler);
};

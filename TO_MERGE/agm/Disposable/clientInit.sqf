// by commy2

// The Arma InventoryOpened EH fires actually before the inventory dialog is opened (findDisplay 602 => displayNull).
if (isNil "AGM_Disposable_UpdateInventoryDisplay_EHID") then {
  AGM_Disposable_UpdateInventoryDisplay_EHID = [{
    _player = AGM_player;
    [_player, secondaryWeapon _player] call AGM_Disposable_fnc_takeLoadedATWeapon;
    [_player, _this select 0] spawn AGM_Disposable_fnc_updateInventoryDisplay;
  }] call AGM_Core_fnc_addInventoryDisplayLoadedEventHandler;
};

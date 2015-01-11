/*
  Name: AGM_VehicleLock_fnc_moduleInit

  Author: Pabst Mirror

  Description:
    Function for setup module.  Sets default lockpick strength, auto handout keys, and default lock state.

  Parameters:
    0: OBJECT - logic

  Returns:
    Nothing

  Example:
    called from module
*/

_this spawn {

  private ["_logic", "_sideKeysAssignment", "_setLockState", "_lock", "_giveSideKey", "_keyClassName"];
  _logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

  _sideKeysAssignment = _logic getVariable["SideKeysAssignment", 0];
  _setLockState = _logic getVariable["SetLockState", 0];

  if (isServer) then {
    [_logic, "AGM_VehicleLock_DefaultLockpickStrength", "LockpickStrength"] call AGM_Core_fnc_readNumericParameterFromModule;

    { //set lock state
      _lock =
        switch (_setLockState) do {
          case (0): {(locked _x) in [2, 3]};
          case (1):{true};
          case (2):{false};
        };
        [_x, _lock] call AGM_VehicleLock_fnc_setVehicleLock;
    }
    forEach vehicles;
  };

  if (hasInterface) then {
    waitUntil {player == player};
    waitUntil {alive player};
    sleep 5;  //need to wait for other gear-assign scripts to finish

    _giveSideKey =
      switch (_sideKeysAssignment) do {
        case (0): {false};
        case (1): {(leader player) == player};
        case (2): {true};
      };

      if (_giveSideKey) then {
        _keyClassName = switch (playerside) do {
            case (west): {"AGM_item_key_west"};
            case (east): {"AGM_item_key_east"};
            case (resistance): {"AGM_item_key_indp"};
            case (civilian): {"AGM_item_key_civ"};
            default {""};
          };
          if (_keyClassName != "") then {
            player addItem _keyClassName;
          };
      };
  };
};

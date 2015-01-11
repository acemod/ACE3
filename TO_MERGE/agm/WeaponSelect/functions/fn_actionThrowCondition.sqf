// by commy2

_muzzle = call AGM_WeaponSelect_fnc_getSelectedGrenade;

_isInput = inputAction "CycleThrownItems" > 0;
if !(_isInput isEqualTo (missionNamespace getVariable ["AGM_WeaponSelect_CycleThrownItemsState", false])) then {
  if (_isInput) then {
    if (_muzzle == "") then {
      [_this select 1] spawn AGM_WeaponSelect_fnc_selectGrenadeAll;
    } else {
      [_this select 1] spawn AGM_WeaponSelect_fnc_selectGrenadeAll;//
    };
  };
  AGM_WeaponSelect_CycleThrownItemsState = _isInput;
};

if !([_this select 1] call AGM_Core_fnc_canUseWeapon) exitWith {false};

if (_muzzle == "") exitWith {["All"] call AGM_WeaponSelect_fnc_findNextGrenadeMagazine != ""};

// fix auto muzzle swap after entering or leaving a vehicle
if (_this select 0 != missionNamespace getVariable ["AGM_WeaponSelect_CurrentGrenadeMuzzleVehicle", objNull]) then {
  [_this select 1, _muzzle] call AGM_WeaponSelect_fnc_setNextGrenadeMuzzle;
  AGM_WeaponSelect_CurrentGrenadeMuzzleVehicle = _this select 0;
};

if ((_this select 1) ammo _muzzle == 0) exitWith {
  if (AGM_WeaponSelect_CurrentGrenadeMuzzleIsFrag) then {AGM_WeaponSelect_CurrentGrenadeMuzzleFrag = ""} else {AGM_WeaponSelect_CurrentGrenadeMuzzleOther = ""};
  [uiNamespace getVariable "AGM_dlgSoldier", false] call AGM_WeaponSelect_fnc_toggleGrenadeCount;
  true
};
false

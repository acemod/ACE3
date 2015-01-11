// by CAA-Picard, commy2

AGM_WeaponSelect_CurrentGrenadeMuzzleIsFrag = true;
AGM_WeaponSelect_CurrentGrenadeMuzzleFrag = "";
AGM_WeaponSelect_CurrentGrenadeMuzzleOther = "";

// Collect frag and other muzzles separately
with uiNamespace do {
  if (isNil "AGM_WeaponSelect_FragMuzzles") then {
    AGM_WeaponSelect_FragMuzzles = [];
    AGM_WeaponSelect_NonFragMuzzles = [];
    AGM_WeaponSelect_AllMuzzles = [];

    AGM_WeaponSelect_FragMagazines = [];
    AGM_WeaponSelect_NonFragMagazines = [];
    AGM_WeaponSelect_AllMagazines = [];

    {
      _magazines = getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
      _magazine = _magazines select 0;

      _ammo = getText (configfile >> "CfgMagazines" >> _magazine >> "ammo");
      _explosive = getNumber (configfile >> "CfgAmmo" >> _ammo >> "explosive");

      if (_explosive == 0) then {
        AGM_WeaponSelect_NonFragMuzzles pushBack _x;
        AGM_WeaponSelect_NonFragMagazines pushBack _magazines;
      } else {
        AGM_WeaponSelect_FragMuzzles pushBack _x;
        AGM_WeaponSelect_FragMagazines pushBack _magazines;
      };
      AGM_WeaponSelect_AllMuzzles pushBack _x;
      AGM_WeaponSelect_AllMagazines pushBack _magazines;
    } forEach getArray (configfile >> "CfgWeapons" >> "Throw" >> "muzzles");
  };
};

AGM_WeaponSelect_FragMuzzles =      uiNamespace getVariable "AGM_WeaponSelect_FragMuzzles";
AGM_WeaponSelect_NonFragMuzzles =   uiNamespace getVariable "AGM_WeaponSelect_NonFragMuzzles";
AGM_WeaponSelect_AllMuzzles =       uiNamespace getVariable "AGM_WeaponSelect_AllMuzzles";
AGM_WeaponSelect_FragMagazines =    uiNamespace getVariable "AGM_WeaponSelect_FragMagazines";
AGM_WeaponSelect_NonFragMagazines = uiNamespace getVariable "AGM_WeaponSelect_NonFragMagazines";
AGM_WeaponSelect_AllMagazines =     uiNamespace getVariable "AGM_WeaponSelect_AllMagazines";

//AGM_WeaponSelect_AllMuzzlesCount = count AGM_WeaponSelect_AllMuzzles;

// hide grenade count if none is selected
[uiNamespace getVariable "AGM_dlgSoldier", false] call AGM_WeaponSelect_fnc_toggleGrenadeCount;
["Soldier", {[_this select 0, call AGM_WeaponSelect_fnc_getSelectedGrenade != ""] call AGM_WeaponSelect_fnc_toggleGrenadeCount}] call AGM_Core_fnc_addInfoDisplayEventHandler;

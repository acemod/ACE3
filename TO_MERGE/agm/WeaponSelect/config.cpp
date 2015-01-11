class CfgPatches {
  class AGM_WeaponSelect {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "KoffeinFlummi", "CAA-Picard"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_WeaponSelect {
    class AGM_WeaponSelect {
      file = "\AGM_WeaponSelect\functions";
      class actionThrow;
      class actionThrowCondition;
      class countMagazinesForGrenadeMuzzle;
      class displayGrenadeTypeAndNumber;
      class findNextGrenadeMagazine;
      class findNextGrenadeMuzzle;
      class fireSmokeLauncher;
      class getSelectedGrenade;
      class getWeaponModes;
      class getWeaponMuzzles;
      class playChangeFiremodeSound;
      class putWeaponAway;
      class selectGrenadeAll;
      class selectGrenadeFrag;
      class selectGrenadeOther;
      class selectWeaponMode;
      class selectWeaponMuzzle;
      class selectWeaponVehicle;
      class selectMagazineVehicle;
      class setNextGrenadeMuzzle;
      class throwGrenade;
      class toggleGrenadeCount;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_WeaponSelect {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_WeaponSelect\clientInit.sqf';";
  };
};

class Extended_Init_EventHandlers {
  class CAManBase {
    class AGM_WeaponSelect_ThrowGrenade {
      clientInit = "_this call compile preprocessFileLineNumbers '\AGM_WeaponSelect\initActions.sqf';";
    };
  };
};
class Extended_Respawn_EventHandlers {
  class CAManBase {
    class AGM_WeaponSelect_ThrowGrenade {
      respawn = "[_this, ""{_this call compile preprocessFileLineNumbers '\AGM_WeaponSelect\initActions.sqf';}""] call AGM_Core_fnc_execRemoteFnc;";
    };
  };
};

class Extended_FiredBIS_EventHandlers {
  class CAManBase {
    class AGM_WeaponSelect_ThrowGrenade {
      clientFiredBIS = "if (_this select 0 == AGM_player) then {_this call AGM_WeaponSelect_fnc_throwGrenade;};";
    };
  };
};

class AGM_Core_Default_Keys {
  class selectPistol {
    displayName = "$STR_AGM_WeaponSelect_SelectPistol";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player, handgunWeapon _player] call AGM_WeaponSelect_fnc_selectWeaponMode";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 2;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class selectRifle {
    displayName = "$STR_AGM_WeaponSelect_SelectRifle";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player, primaryWeapon _player] call AGM_WeaponSelect_fnc_selectWeaponMode";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 3;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class selectLauncher {
    displayName = "$STR_AGM_WeaponSelect_SelectLauncher";
    condition = "_player == _vehicle";
    statement = "[_player, secondaryWeapon _player] call AGM_WeaponSelect_fnc_selectWeaponMode";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 5;
    shift = 0;
    control = 0;
    alt = 0;
  };
  /*class selectPistolMuzzle {
    displayName = "Select Pistol Muzzle";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player, handgunWeapon _player] call AGM_WeaponSelect_fnc_selectWeaponMuzzle";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    disabled = 1;
    key = 7;
    shift = 0;
    control = 0;
    alt = 0;
  };*/
  class selectRifleMuzzle {
    displayName = "$STR_AGM_WeaponSelect_SelectRifleMuzzle";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player, primaryWeapon _player] call AGM_WeaponSelect_fnc_selectWeaponMuzzle";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 4;
    shift = 0;
    control = 0;
    alt = 0;
  };
  /*class selectLauncherMuzzle {
    displayName = "Select Launcher Muzzle";
    condition = "_player == _vehicle";
    statement = "[_player, secondaryWeapon _player] call AGM_WeaponSelect_fnc_selectWeaponMuzzle";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    disabled = 1;
    key = 8;
    shift = 0;
    control = 0;
    alt = 0;
  };*/
  class selectBinocular {
    displayName = "$STR_AGM_WeaponSelect_SelectBinocular";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player, binocular _player] call AGM_WeaponSelect_fnc_selectWeaponMode";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 6;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class selectGrenadeFrag {
    displayName = "$STR_AGM_WeaponSelect_SelectGrenadeFrag";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player] call AGM_WeaponSelect_fnc_selectGrenadeFrag";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 7;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class selectGrenadeOther {
    displayName = "$STR_AGM_WeaponSelect_SelectGrenadeOther";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player] call AGM_WeaponSelect_fnc_selectGrenadeOther";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 8;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class holsterWeapon {
    displayName = "$STR_AGM_WeaponSelect_HolsterWeapon";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player] call AGM_WeaponSelect_fnc_putWeaponAway";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 11;
    shift = 0;
    control = 0;
    alt = 0;
  };

  class engineOn {
    displayName = "$STR_AGM_WeaponSelect_EngineOn";
    condition = "_player != _vehicle && {_player == driver _vehicle} && {!isEngineOn _vehicle}";
    statement = "_vehicle engineOn true";
    key = 3;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class engineOff {
    displayName = "$STR_AGM_WeaponSelect_EngineOff";
    condition = "_player != _vehicle && {_player == driver _vehicle} && {isEngineOn _vehicle}";
    statement = "_vehicle engineOn false";
    key = 2;
    shift = 0;
    control = 0;
    alt = 0;
  };

  class selectMaingun {
    displayName = "$STR_AGM_WeaponSelect_SelectMainGun";
    condition = "_player != _vehicle";
    statement = "[_player, _vehicle, 0] call AGM_WeaponSelect_fnc_selectWeaponVehicle";
    key = 4;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class selectMachineGun {
    displayName = "$STR_AGM_WeaponSelect_SelectMachineGun";
    condition = "_player != _vehicle";
    statement = "[_player, _vehicle, 1] call AGM_WeaponSelect_fnc_selectWeaponVehicle";
    key = 5;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class selectMissile {
    displayName = "$STR_AGM_WeaponSelect_SelectMissiles";
    condition = "_player != _vehicle";
    statement = "[_player, _vehicle, 2] call AGM_WeaponSelect_fnc_selectWeaponVehicle";
    key = 6;
    shift = 0;
    control = 0;
    alt = 0;
  };

  class fireSmokeLauncher {
    displayName = "$STR_AGM_WeaponSelect_FireSmokeLauncher";
    condition = "_player != _vehicle && {_player == commander _vehicle}";
    statement = "[_vehicle] call AGM_WeaponSelect_fnc_fireSmokeLauncher";
    key = 10;
    shift = 0;
    control = 0;
    alt = 0;
  };
};

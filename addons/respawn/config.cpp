class CfgPatches {
  class AGM_Respawn {
    units[] = {};
    weapons[] = {"AGM_Rallypoint_West", "AGM_Rallypoint_East", "AGM_Rallypoint_Independent", "AGM_RallypointExit_West", "AGM_RallypointExit_East", "AGM_RallypointExit_Independent"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"bux578", "commy2"};
    authorUrl = "https://github.com/bux578/";
  };
};

class CfgFunctions {
  class AGM_Respawn {
    class AGM_Respawn {
      file = "AGM_Respawn\functions";
      class canMoveRallypoint;
      class getAllGear;
      class handleKilled;
      class handleRespawn;
      class initRallypoint;
      class module;
      class moduleFriendlyFire;
      class moduleRallypoint;
      class moveRallypoint;
      class removeBody;
      class removeDisconnectedPlayer;
      class restoreGear;
      class showFriendlyFireMessage;
      class teleportToRallypoint;
    };
  };
};

class Extended_Killed_EventHandlers {
  class CAManBase {
    class AGM_Respawn_HandleGear {
      killed = "_this call AGM_Respawn_fnc_handleKilled";
    };
  };
};
class Extended_Respawn_EventHandlers {
  class CAManBase {
    class AGM_Respawn_HandleGear {
      respawn = "_this call AGM_Respawn_fnc_handleRespawn";
    };
  };
};

class CfgAddons {
  class AGM_Respawn_Rallypoints {
    list[] = {"AGM_Rallypoint_West", "AGM_Rallypoint_East", "AGM_Rallypoint_Independent", "AGM_RallypointExit_West", "AGM_RallypointExit_East", "AGM_RallypointExit_Independent"};
  };
};

class CfgVehicleClasses {
  class AGM_Respawn_Rallypoints {
    displayName = "AGM Respawn";
  };
};

class CfgVehicles {
  class Module_F;
  class AGM_ModuleRespawn: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Respawn System";
    function = "AGM_Respawn_fnc_module";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Respawn\UI\Icon_Module_Respawn_ca.paa";
    class Arguments {
      class SavePreDeathGear {
        displayName = "Save Gear?";
        description = "Respawn with the gear a soldier had just before his death?";
        typeName = "BOOL";
        class values {
          class Yes { name = "Yes"; value = 1;};
          class No { default = 1; name = "No"; value = 0; };
        };
      };
      class RemoveDeadBodiesDisonncected {
        displayName = "Remove bodies?";
        description = "Remove player bodies after disconnect?";
        typeName = "BOOL";
        class values {
          class Yes { default = 1; name = "Yes"; value = 1;};
          class No { name = "No"; value = 0; };
        };
      };
      /*class BodyRemoveTimer {
        displayName = "Time to remove bodies.";
        description = "The amount of time (in seconds) after that a unit's body gets removed. Default: 90";
        typeName = "NUMBER";
        defaultValue = 90;
      };*/
    };
  };

  class AGM_ModuleFriendlyFire: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Friendly Fire Messages";
    function = "AGM_Respawn_fnc_moduleFriendlyFire";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Respawn\UI\Icon_Module_FriendlyFire_ca.paa";
    class Arguments {
    };
  };

  class AGM_ModuleRallypoint: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Rallypoint System";
    function = "AGM_Respawn_fnc_moduleRallypoint";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Respawn\UI\Icon_Module_Rallypoint_ca.paa";
    class Arguments {
    };
  };

  // rallypoints
  class FlagCarrier;
  class Flag_NATO_F: FlagCarrier {
    class AGM_Actions;
  };

  class Flag_CSAT_F: FlagCarrier {
    class AGM_Actions;
  };

  class Flag_AAF_F: FlagCarrier {
    class AGM_Actions;
  };

  // static
  class AGM_Rallypoint_West: Flag_NATO_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Rallypoint West Base";
    vehicleClass = "AGM_Respawn_Rallypoints";

    class EventHandlers {
      init = "(_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; _this call AGM_Respawn_fnc_initRallypoint";
    };
    class AGM_Actions: AGM_Actions {
      class AGM_Teleport {
        displayName = "Teleport to Rallypoint";
        distance = 4;
        condition = "side group _player == west";
        statement = "[_player, side group _player, false] call AGM_Respawn_fnc_teleportToRallypoint;";
        showDisabled = 1;
        priority = 1;
      };
    };
  };

  class AGM_Rallypoint_East: Flag_CSAT_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Rallypoint East Base";
    vehicleClass = "AGM_Respawn_Rallypoints";

    class EventHandlers {
      init = "(_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; _this call AGM_Respawn_fnc_initRallypoint";
    };
    class AGM_Actions: AGM_Actions {
      class AGM_Teleport {
        displayName = "Teleport to Rallypoint";
        distance = 4;
        condition = "side group _player == east";
        statement = "[_player, side group _player, false] call AGM_Respawn_fnc_teleportToRallypoint;";
        showDisabled = 1;
        priority = 1;
      };
    };
  };

  class AGM_Rallypoint_Independent: Flag_AAF_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Rallypoint Independent Base";
    vehicleClass = "AGM_Respawn_Rallypoints";

    class EventHandlers {
      init = "(_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; _this call AGM_Respawn_fnc_initRallypoint";
    };
    class AGM_Actions: AGM_Actions {
      class AGM_Teleport {
        displayName = "Teleport to Rallypoint";
        distance = 4;
        condition = "side group _player == independent";
        statement = "[_player, side group _player, false] call AGM_Respawn_fnc_teleportToRallypoint;";
        showDisabled = 1;
        priority = 1;
      };
    };
  };

  // moveable
  class AGM_RallypointExit_West: Flag_NATO_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Rallypoint West";
    vehicleClass = "AGM_Respawn_Rallypoints";

    class EventHandlers {
      init = "(_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; _this call AGM_Respawn_fnc_initRallypoint";
    };
    class AGM_Actions: AGM_Actions {
      class AGM_Teleport {
        displayName = "Teleport to Base";
        distance = 4;
        condition = "side group _player == west";
        statement = "[_player, side group _player, true] call AGM_Respawn_fnc_teleportToRallypoint;";
        showDisabled = 1;
        priority = 1;
      };
    };
  };

  class AGM_RallypointExit_East: Flag_CSAT_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Rallypoint East";
    vehicleClass = "AGM_Respawn_Rallypoints";

    class EventHandlers {
      init = "(_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; _this call AGM_Respawn_fnc_initRallypoint";
    };
    class AGM_Actions: AGM_Actions {
      class AGM_Teleport {
        displayName = "Teleport to Base";
        distance = 4;
        condition = "side group _player == east";
        statement = "[_player, side group _player, true] call AGM_Respawn_fnc_teleportToRallypoint;";
        showDisabled = 1;
        priority = 1;
      };
    };
  };

  class AGM_RallypointExit_Independent: Flag_AAF_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Rallypoint Independent";
    vehicleClass = "AGM_Respawn_Rallypoints";

    class EventHandlers {
      init = "(_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; _this call AGM_Respawn_fnc_initRallypoint";
    };
    class AGM_Actions: AGM_Actions {
      class AGM_Teleport {
        displayName = "Teleport to Base";
        distance = 4;
        condition = "side group _player == independent";
        statement = "[_player, side group _player, true] call AGM_Respawn_fnc_teleportToRallypoint;";
        showDisabled = 1;
        priority = 1;
      };
    };
  };

  // team leader
  class Man;
  class CAManBase: Man {
    class AGM_SelfActions {
      class AGM_MoveRallypoint {
        displayName = "Move Rallypoint";
        condition = "[_player, side group _player] call AGM_Respawn_fnc_canMoveRallypoint";
        statement = "[_player, side group _player] call AGM_Respawn_fnc_moveRallypoint";
        showDisabled = 0;
        priority = -0.5;
      };
    };
  };
};

class AGM_Parameters_Boolean {
  // Boolean Parameters (0/1)
  AGM_Respawn_SavePreDeathGear = 0;
  AGM_Respawn_RemoveDeadBodiesDisonncected = 1;
};

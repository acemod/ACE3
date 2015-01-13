class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call COMPILE_FILE(XEH_preInit) );
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    clientInit = QUOTE( call COMPILE_FILE(XEH_postInitClient) );
  };
};

class Extended_FiredBIS_EventHandlers {
  class CAManBase {
    class ADDON {
      // firedBIS = "if (local (_this select 0)) then {_this call AGM_Disposable_fnc_replaceATWeapon};";
      firedBIS = QUOTE( _this call FUNC(replaceATWeapon); );
    };
  };
};

// handle preloaded missile
class Extended_Init_EventHandlers {
  class CAManBase {
    class ADDON {
      init = "if (local (_this select 0)) then {_this spawn {[_this select 0, secondaryWeapon (_this select 0)] call AGM_Disposable_fnc_takeLoadedATWeapon}};";
    };
  };
};

class Extended_Take_EventHandlers {
  class CAManBase {
    class ADDON {
      take = "if (local (_this select 0)) then {[_this select 0, _this select 2] call AGM_Disposable_fnc_takeLoadedATWeapon; [_this select 0, findDisplay 602] call AGM_Disposable_fnc_updateInventoryDisplay};";
    };
  };
};

class Extended_Put_EventHandlers {
  class CAManBase {
    class ADDON {
      put = "if (local (_this select 0)) then {[_this select 0, findDisplay 602] call AGM_Disposable_fnc_updateInventoryDisplay};";
    };
  };
};

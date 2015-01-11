class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    clientInit = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_clientInit.sqf) );
  };
};

class Extended_GetIn_EventHandlers {
  class All {
    class ADDONnu {
      clientGetIn = QUOTE( if (_this select 2 == AGM_player && {!isNull (findDisplay 1713999)}) then {(findDisplay 1713999) closeDisplay 1});
    };
  };
};

class Extended_GetOut_EventHandlers {
  class All {
    class ADDONnu {
      clientGetOut = QUOTE( if (_this select 2 == AGM_player && {!isNull (findDisplay 1713999)}) then {(findDisplay 1713999) closeDisplay 1});
    };
  };
};

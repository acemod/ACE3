class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call COMPILE_FILE(XEH_preInit) );
  };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class GVAR(Overheat) {
            firedBIS = QUOTE(_this call FUNC(firedEH));
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class GVAR(UnjamReload) {
            clientTake = QUOTE( if (_this select 0 == ACE_player && {(_this select 1) in [ARR_3(uniformContainer (_this select 0), vestContainer (_this select 0), backpackContainer (_this select 0))]} && {_this select 2 == currentMagazine (_this select 0)}) then {_vehicle = vehicle (_this select 0); [ARR_3(_vehicle, currentWeapon _vehicle, true)] call FUNC(clearJam)}; );
        };
    };
};

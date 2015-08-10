class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ACE_AmmoIndicatorReload {
            clientTake = QUOTE(if (_this select 0 == ACE_player && {GVAR(DisplayText)} && {(_this select 1) in [ARR_3(uniformContainer (_this select 0), vestContainer (_this select 0), backpackContainer (_this select 0))]} && {_this select 2 == currentMagazine (_this select 0)}) then {[ARR_2(_this select 0, vehicle (_this select 0))] call FUNC(displayAmmo)};);
        };
    };
};

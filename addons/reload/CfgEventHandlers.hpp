
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

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
            clientTake = QUOTE(params ['_unit']; if (_unit == ACE_player && {GVAR(DisplayText)} && {(_this select 1) in [ARR_3(uniformContainer _unit, vestContainer _unit, backpackContainer _unit)]} && {_this select 2 == currentMagazine _unit}) then {[ARR_2(_unit, vehicle _unit)] call FUNC(displayAmmo)};);
        };
    };
};

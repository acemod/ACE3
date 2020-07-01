
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
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ACE_AmmoIndicatorReload {
            clientTake = QUOTE( \
                params [ARR_3('_unit', '_container', '_item')]; \
                if ( \
                    _unit == ACE_player \
                    && {GVAR(DisplayText)} \
                    && {_container in [ARR_3(uniformContainer _unit, vestContainer _unit, backpackContainer _unit)]} \
                    && {_item == currentMagazine _unit} \
                ) then {_unit call DFUNC(displayAmmo)}; \
            );
        };
    };
};

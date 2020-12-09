// These files are from the VR mission, not the base addon folder
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call compile preprocessFileLineNumbers 'XEH_preInit.sqf');
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call compile preprocessFileLineNumbers 'XEH_postInit.sqf');
    };
};

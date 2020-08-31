
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

//EH must be loaded this way to get ace_gunbag_gunbagWeapon before it is deleted upon opening the BI arsenal. May cause instability with other mods.
class RscPicture;
class RscDisplayArsenal {
    class Controls {
        class IconBackgroundPrimaryWeapon: RscPicture {
            onLoad = QUOTE(_this call FUNC(BIArsenalOpen));
        };
    };
};

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayArsenal {
        ADDON = QUOTE(_this call FUNC(BIArsenalClose));
    };
};

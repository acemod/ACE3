
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

class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> 'ACE_Backblast_Damage') > 0}) then {_this call DFUNC(fireLauncherBackblast)});
        };
    };
    class AllVehicles {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> 'ACE_DangerZone_Damage') > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
};


class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_FiredNear_EventHandlers {
    class CAManBase {
        class GVAR(LauncherBackblast) {
            FiredNear = QUOTE( if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 3 >> 'ACE_Backblast_Damage') > 0}) then {_this call FUNC(launcherBackblast)} );
        };
        class GVAR(TankDangerZone) {
            FiredNear = QUOTE( if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 3 >> 'ACE_DangerZone_Damage') > 0}) then {_this call FUNC(tankDangerZone)} );
        };
    };
};


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
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireLauncherBackblast)});
        };
    };

    class Tank {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
    class Car {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
    class Helicopter {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
    class Plane {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
    class Ship_F {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
    class StaticWeapon {
        class ADDON {
            firedBIS = QUOTE(if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 1 >> QUOTE(QGVAR(Damage))) > 0}) then {_this call DFUNC(fireOverpressureZone)});
        };
    };
};

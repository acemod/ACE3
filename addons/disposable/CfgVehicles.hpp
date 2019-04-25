/*
private _classes = "true" configClasses (configFile >> "CfgVehicles");

_classes = _classes select {
    isClass (_x >> "TransportMagazines" >> "_xx_NLAW_F") && {(_x >> "TransportMagazines") in ("true" configClasses _x)}
};

private _config = "";
private _parents = [];

{
    private _class = configName _x;
    private _parent = configName inheritsFrom _x;

    if (_parents pushBackUnique _parent != -1) then {
        _config = _config + format ["class %1;%2", _parent, endl];
    };

    _config = _config + format ["class %1: %2 {%3    MACRO_NONLAW;%3};%3%3", _class, _parent, endl];
    _parents pushBackUnique _class;
} forEach _classes;

copyToClipboard _config;
*/

class CfgVehicles {
    class Launcher_Base_F;
    class Weapon_launch_NLAW_F: Launcher_Base_F {
        class TransportMagazines {
            class NLAW_F {
                count = 0;
            };
        };
    };

    #define MACRO_NONLAW class TransportMagazines {\
        class _xx_NLAW_F {\
            count = 0;\
        };\
    }

    class NATO_Box_Base;
    class Box_NATO_Ammo_F: NATO_Box_Base {
        MACRO_NONLAW;
    };

    class Box_NATO_WpsLaunch_F: NATO_Box_Base {
        MACRO_NONLAW;
    };

    class IND_Box_Base;
    class Box_IND_WpsLaunch_F: IND_Box_Base {
        MACRO_NONLAW;
    };

    class Box_IND_Ammo_F: IND_Box_Base {
        MACRO_NONLAW;
    };

    class ReammoBox_F;
    class B_supplyCrate_F: ReammoBox_F {
        MACRO_NONLAW;
    };

    class I_supplyCrate_F: B_supplyCrate_F {
        MACRO_NONLAW;
    };

    class C_supplyCrate_F: ReammoBox_F {
        MACRO_NONLAW;
    };

    class B_AssaultPack_rgr;
    class B_AssaultPack_rgr_LAT: B_AssaultPack_rgr {
        MACRO_NONLAW;
    };

    class B_AssaultPack_rgr_ReconLAT: B_AssaultPack_rgr {
        MACRO_NONLAW;
    };

    class B_Carryall_mcamo;
    class B_AssaultPack_mcamo_Ammo: B_Carryall_mcamo {
        MACRO_NONLAW;
    };

    class B_Carryall_oli;
    class I_Fieldpack_oli_Ammo: B_Carryall_oli {
        MACRO_NONLAW;
    };

    class B_AssaultPack_dgtl;
    class I_Fieldpack_oli_LAT: B_AssaultPack_dgtl {
        MACRO_NONLAW;
    };

    class Tank_F;
    class APC_Tracked_01_base_F: Tank_F {
        MACRO_NONLAW;
    };

    class APC_Tracked_03_base_F: Tank_F {
        MACRO_NONLAW;
    };

    class Car_F;
    class MRAP_01_base_F: Car_F {
        MACRO_NONLAW;
    };

    class MRAP_03_base_F: Car_F {
        MACRO_NONLAW;
    };

    class LSV_01_base_F: Car_F {
        MACRO_NONLAW;
    };

    class Wheeled_APC_F;
    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        MACRO_NONLAW;
    };

    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        MACRO_NONLAW;
    };

    class CargoNet_01_ammo_base_F;
    class B_CargoNet_01_ammo_F: CargoNet_01_ammo_base_F {
        MACRO_NONLAW;
    };

    class I_CargoNet_01_ammo_F: CargoNet_01_ammo_base_F {
        MACRO_NONLAW;
    };

    class Slingload_01_Base_F;
    class B_Slingload_01_Cargo_F: Slingload_01_Base_F {
        MACRO_NONLAW;
    };

    class B_T_LSV_01_armed_F;
    class B_T_LSV_01_armed_CTRG_F: B_T_LSV_01_armed_F {
        MACRO_NONLAW;
    };

    class B_T_LSV_01_unarmed_F;
    class B_T_LSV_01_unarmed_CTRG_F: B_T_LSV_01_unarmed_F {
        MACRO_NONLAW;
    };

    class LSV_01_light_base_F;
    class B_CTRG_LSV_01_light_F: LSV_01_light_base_F {
        MACRO_NONLAW;
    };

    class B_Carryall_oli_BTAmmo_F: B_Carryall_oli {
        MACRO_NONLAW;
    };

    class B_AssaultPack_rgr_BTLAT_F: B_AssaultPack_rgr {
        MACRO_NONLAW;
    };

    class B_AssaultPack_rgr_CTRGLAT_F: B_AssaultPack_rgr {
        MACRO_NONLAW;
    };

    class C_T_supplyCrate_F: ReammoBox_F {
        MACRO_NONLAW;
    };
};

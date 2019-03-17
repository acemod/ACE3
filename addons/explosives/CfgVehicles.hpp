class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Explosives {
                displayName = CSTRING(Menu);
                condition = QUOTE(!(_player getVariable [ARR_2(QQGVAR(PlantingExplosive),false)]));
                statement = "";
                exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                showDisabled = 1;
                icon = QPATHTOF(UI\Explosives_Menu_ca.paa);
                insertChildren = QUOTE([_player] call FUNC(addTransmitterActions););
                class ACE_Place {
                    displayName = CSTRING(Place);
                    statement = "";
                    condition = "true";
                    exceptions[] = {"isNotSwimming"};
                    icon = QPATHTOF(UI\Place_Explosive_ca.paa);
                    insertChildren = QUOTE(_player call FUNC(addExplosiveActions));
                };
                class ACE_Cellphone {
                    displayName = CSTRING(cellphone_displayName);
                    condition = "('ACE_Cellphone' in (items ace_player))";
                    statement = "closeDialog 0;createDialog 'Rsc_ACE_PhoneInterface';";
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(Data\UI\Cellphone_UI.paa);
                };
            };
        };
    };

    class Items_base_F;
    class ACE_DefuseObject: Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,aceteam);
        _generalMacro = "ACE_DefuseObject";
        displayName = "ACE Defuse Helper";
        model = "\A3\Weapons_f\dummyweapon.p3d";
        scope = 1;

        class ACE_Actions {
            class ACE_Defuse {
                distance = 1;
                displayName = CSTRING(Defuse);
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canDefuse));
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(startDefuse););
                exceptions[] = {"isNotSwimming"};
                icon = QPATHTOF(UI\Defuse_ca.paa);
            };
        };
    };
    class ACE_DefuseObject_Large: ACE_DefuseObject {
        class ACE_Actions: ACE_Actions {
            class ACE_Defuse: ACE_Defuse {
                distance = 2;
            };
        };
    };

    class ACE_Explosives_Place: Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        author = ECSTRING(common,aceteam);
        _generalMacro = "ACE_Explosives_Place";
        displayName = "Multi-meter";
        mapSize = 0.2;
        icon = "iconObject_1x2";
        model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
        scope = 1;
        vehicleClass = "Cargo";
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 1.5;
                condition = "true";
                class ACE_SetTrigger {
                    selection = "";
                    displayName = CSTRING(TriggerMenu);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE([ARR_3(_target getVariable QUOTE(QGVAR(class)),_target,_player)] call FUNC(addTriggerActions););
                    showDisabled = 0;
                    exceptions[] = {"isNotSwimming"};
                    icon = QPATHTOF(UI\Explosives_Menu_ca.paa);
                };
                class ACE_PickUp {
                    selection = "";
                    displayName = CSTRING(Pickup);
                    condition = "true";
                    statement = QUOTE([ARR_2(_player,_target getVariable QUOTE(QGVAR(class)))] call EFUNC(common,addToInventory);deleteVehicle _target;);
                    showDisabled = 0;
                    exceptions[] = {"isNotSwimming"};
                    icon = "\A3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_takemine_ca.paa";
                };
            };
        };
    };

    class ACE_Explosives_Place_DemoCharge: ACE_Explosives_Place {
        displayName = "Demo Charge";
        model = "\A3\Weapons_F\explosives\c4_charge_small_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.07,0,0.055]";
            };
        };
    };
    class ACE_Explosives_Place_APERSBoundingMine: ACE_Explosives_Place {
        displayName = "APERS Bounding Mine";
        model = "\A3\Weapons_F\explosives\mine_AP_bouncing";
    };
    class ACE_Explosives_Place_APERSMine: ACE_Explosives_Place {
        displayName = "APERS Mine";
        model = "\A3\Weapons_F\explosives\mine_ap";
    };
    class ACE_Explosives_Place_APERSTripwireMine: ACE_Explosives_Place {
        displayName = "APERS Tripwire Mine";
        model = "\A3\Weapons_F\explosives\mine_AP_tripwire";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[1.415,0,0.12]";
            };
        };
    };

    class ACE_Explosives_Place_ATMine: ACE_Explosives_Place {
        displayName = "AT Mine";
        model = "\A3\Weapons_f\Explosives\mine_at";
    };

    class ACE_Explosives_Place_Claymore: ACE_Explosives_Place {
        displayName = "Claymore";
        model = "\A3\Weapons_F\explosives\mine_AP_miniclaymore";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0,0,0.038]";
            };
        };
    };

    class ACE_Explosives_Place_SatchelCharge: ACE_Explosives_Place {
        displayName = "Satchel Charge";
        model = "\A3\Weapons_F\Explosives\satchel";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.1,-0.1,0.05]";
            };
        };
    };

    // Orange DLC:
    class ACE_Explosives_Place_APERSMineDispenser: ACE_Explosives_Place {
        displayName = "APERSMineDispenser";
        model = "\A3\Weapons_F_Orange\Explosives\APERSmineDispenser";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.0, -0.05, 0.15]";
            };
        };
    };
    class ACE_Explosives_Place_TrainingMine: ACE_Explosives_Place {
        displayName = "TrainingMine";
        model = "\A3\Weapons_F_Orange\Explosives\TrainingMine_F";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.15]";
            };
        };
    };


    class ACE_Explosives_Place_SLAM: ACE_Explosives_Place {
        displayName = "SLAM";
        model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
    };

    // IEDs
    class ACE_Explosives_Place_IEDUrbanBig: ACE_Explosives_Place {
        displayName = "IED Urban Big";
        model = "\A3\Weapons_F\Explosives\IED_urban_big";
    };

    class ACE_Explosives_Place_IEDLandBig: ACE_Explosives_Place {
        displayName = "IED Land Big";
        model = "\A3\Weapons_F\Explosives\IED_land_big";
    };

    class ACE_Explosives_Place_IEDUrbanSmall: ACE_Explosives_Place {
        displayName = "IED Urban Small";
        model = "\A3\Weapons_F\Explosives\IED_urban_small";
    };

    class ACE_Explosives_Place_IEDLandSmall: ACE_Explosives_Place {
        displayName = "IED Land Small";
        model = "\A3\Weapons_F\Explosives\IED_land_small";
    };

    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;
    class Box_NATO_Support_F;

    class Box_NATO_AmmoOrd_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Clacker,12);
            MACRO_ADDITEM(ACE_M26_Clacker,6);
            MACRO_ADDITEM(ACE_DefusalKit,12);
        };
    };

    class Box_East_AmmoOrd_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Clacker,12);
            MACRO_ADDITEM(ACE_M26_Clacker,6);
            MACRO_ADDITEM(ACE_DefusalKit,12);
        };
    };

    class Box_IND_AmmoOrd_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Clacker,12);
            MACRO_ADDITEM(ACE_M26_Clacker,6);
            MACRO_ADDITEM(ACE_DefusalKit,12);
            MACRO_ADDITEM(ACE_Deadmanswitch,2);
            MACRO_ADDITEM(ACE_Cellphone,3);
        };
    };

    class Box_FIA_Ammo_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Clacker,2);
            MACRO_ADDITEM(ACE_M26_Clacker,2);
            MACRO_ADDITEM(ACE_DefusalKit,2);
            MACRO_ADDITEM(ACE_Deadmanswitch,1);
            MACRO_ADDITEM(ACE_Cellphone,2);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Clacker,12);
            MACRO_ADDITEM(ACE_M26_Clacker,6);
            MACRO_ADDITEM(ACE_DefusalKit,12);
            MACRO_ADDITEM(ACE_Deadmanswitch,6);
            MACRO_ADDITEM(ACE_Cellphone,10);
        };
    };

    class B_Kitbag_rgr;
    class B_Kitbag_rgr_Exp: B_Kitbag_rgr {
        class TransportItems {
            class _xx_ToolKit { // xXToOlKiT420mLgXx
                count = 0;
            };
        };
    };
    class B_Carryall_ocamo;
    class B_Carryall_ocamo_Exp: B_Carryall_ocamo {
        class TransportItems {
            class _xx_ToolKit {
                count = 0;
            };
        };
    };
    class B_Carryall_oucamo;
    class B_Carryall_oucamo_Exp: B_Carryall_oucamo {
        class TransportItems {
            class _xx_ToolKit {
                count = 0;
            };
        };
    };
    class B_Carryall_oli;
    class G_Carryall_Exp: B_Carryall_oli {
        class TransportItems {
            class _xx_ToolKit {
                count = 0;
            };
        };
    };
    class I_Carryall_oli_Exp: B_Carryall_oli {
        class TransportItems {
            class _xx_ToolKit {
                count = 0;
            };
        };
    };

    #include "CfgModule.hpp"

    // Add ACE_Clacker and ACE_DefusalKit to every explosive unit.
    #define MACRO_ADDMINEKIT \
    items[] = {"FirstAidKit","ACE_Clacker","ACE_DefusalKit"}; \
    respawnitems[] = {"FirstAidKit","ACE_Clacker","ACE_DefusalKit"};

    class B_Soldier_base_F; class B_soldier_exp_F: B_Soldier_base_F {MACRO_ADDMINEKIT};
    class B_Soldier_03_f; class B_engineer_F: B_Soldier_03_f {MACRO_ADDMINEKIT};
    class B_Soldier_diver_base_F; class B_diver_exp_F: B_Soldier_diver_base_F {MACRO_ADDMINEKIT};
    class B_Soldier_recon_base; class B_recon_exp_F: B_Soldier_recon_base {MACRO_ADDMINEKIT};
    class B_Soldier_02_f; class B_CTRG_soldier_engineer_exp_F: B_Soldier_02_f {MACRO_ADDMINEKIT};
    class I_G_Soldier_base_F; class I_G_engineer_F: I_G_Soldier_base_F {MACRO_ADDMINEKIT};
    class I_G_Soldier_exp_F: I_G_Soldier_base_F {MACRO_ADDMINEKIT};
    class B_G_engineer_F: I_G_engineer_F {MACRO_ADDMINEKIT};
    class O_G_engineer_F: I_G_engineer_F {MACRO_ADDMINEKIT};
    class B_G_Soldier_exp_F: I_G_Soldier_exp_F {MACRO_ADDMINEKIT};
    class O_G_Soldier_exp_F: I_G_Soldier_exp_F {MACRO_ADDMINEKIT};
    class I_Soldier_02_F; class I_Soldier_exp_F: I_Soldier_02_F {MACRO_ADDMINEKIT};
    class I_Soldier_base_F; class I_engineer_F: I_Soldier_base_F {MACRO_ADDMINEKIT};
    class I_Soldier_diver_base_F; class I_diver_exp_F: I_Soldier_diver_base_F {MACRO_ADDMINEKIT};
    class O_Soldier_base_F; class O_soldier_exp_F: O_Soldier_base_F {MACRO_ADDMINEKIT};
    class O_engineer_F: O_Soldier_base_F {MACRO_ADDMINEKIT};
    class O_Soldier_diver_base_F; class O_diver_exp_F: O_Soldier_diver_base_F {MACRO_ADDMINEKIT};
    class O_Soldier_recon_base; class O_recon_exp_F: O_Soldier_recon_base {MACRO_ADDMINEKIT};
    class O_Soldier_Urban_base; class O_soldierU_exp_F: O_Soldier_Urban_base {MACRO_ADDMINEKIT};
    class O_engineer_U_F: O_Soldier_Urban_base {MACRO_ADDMINEKIT};
    class B_Protagonist_VR_F: B_Soldier_base_F {MACRO_ADDMINEKIT};
    class O_Protagonist_VR_F: O_Soldier_base_F {MACRO_ADDMINEKIT};
    class I_Protagonist_VR_F: I_Soldier_base_F {MACRO_ADDMINEKIT};
    class B_Soldier_F; class b_soldier_universal_f: B_Soldier_F {MACRO_ADDMINEKIT};
    class B_G_Soldier_F; class b_g_soldier_universal_f: B_G_Soldier_F {MACRO_ADDMINEKIT};
    class O_Soldier_F; class o_soldier_universal_f: O_Soldier_F {MACRO_ADDMINEKIT};
    class O_G_Soldier_F; class o_g_soldier_universal_f: O_G_Soldier_F {MACRO_ADDMINEKIT};
    class I_soldier_F; class i_soldier_universal_f: I_soldier_F {MACRO_ADDMINEKIT};
    class I_G_Soldier_F; class i_g_soldier_universal_f: I_G_Soldier_F {MACRO_ADDMINEKIT};
    class B_CTRG_Soldier_F; class B_CTRG_Soldier_Exp_tna_F: B_CTRG_Soldier_F {MACRO_ADDMINEKIT};
    class O_V_Soldier_base_F; class O_V_Soldier_Exp_hex_F: O_V_Soldier_base_F {MACRO_ADDMINEKIT};
    class O_V_Soldier_Exp_ghex_F: O_V_Soldier_Exp_hex_F {MACRO_ADDMINEKIT};

    // Add ACE_Clacker to snipers and spotters for setting off Claymores
    #define MACRO_ADDCLAYMOREKIT \
    items[] = {"FirstAidKit","ACE_Clacker"}; \
    respawnitems[] = {"FirstAidKit","ACE_Clacker"};

    class B_Soldier_sniper_base_F;
    class B_sniper_F: B_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class B_spotter_F: B_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class I_Soldier_sniper_base_F;
    class I_Sniper_F: I_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class I_Spotter_F: I_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class O_Soldier_sniper_base_F;
    class O_sniper_F: O_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class O_spotter_F: O_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class B_ghillie_base_F: B_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class O_ghillie_base_F: O_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class I_ghillie_base_F: I_Soldier_sniper_base_F {MACRO_ADDCLAYMOREKIT};
    class O_T_Spotter_F: O_spotter_F {MACRO_ADDCLAYMOREKIT};

    // Editor placed mines
    class MineBase;
    class SLAMDirectionalMine: MineBase {
        displayName = CSTRING(Module_SLAMSideAttack_DisplayName);
    };
    class ACE_SLAMBottomMine: SLAMDirectionalMine {
        author = ECSTRING(common,aceteam);
        ammo = "ACE_SLAMDirectionalMine_Magnetic_Ammo";
        displayName = CSTRING(Module_SLAMBottomAttack_DisplayName);
        // TODO: Find a way to place the mine laying down instead of standing up
    };

    class APERSTripMine: MineBase {};
    class ACE_FlareTripMine: APERSTripMine {
        author = ECSTRING(common,aceteam);
        ammo = "ACE_FlareTripMine_Wire_Ammo";
        displayName = CSTRING(TripFlare_Name);
    };

    class IEDUrbanBig_F;
    class ACE_IEDUrbanBig_Range: IEDUrbanBig_F {
        author = ECSTRING(common,aceteam);
        ammo = "ACE_IEDUrbanBig_Range_Ammo";
        displayName = CSTRING(Module_IEDUrbanBig_Range_DisplayName);
    };
    class IEDLandBig_F;
    class ACE_IEDLandBig_Range: IEDLandBig_F {
        author = ECSTRING(common,aceteam);
        ammo = "ACE_IEDLandBig_Range_Ammo";
        displayName = CSTRING(Module_IEDLandBig_Range_DisplayName);
    };
    class IEDUrbanSmall_F;
    class ACE_IEDUrbanSmall_Range: IEDUrbanSmall_F {
        author = ECSTRING(common,aceteam);
        ammo = "ACE_IEDUrbanSmall_Range_Ammo";
        displayName = CSTRING(Module_IEDUrbanSmall_Range_DisplayName);
    };
    class IEDLandSmall_F;
    class ACE_IEDLandSmall_Range: IEDLandSmall_F {
        author = ECSTRING(common,aceteam);
        ammo = "ACE_IEDLandSmall_Range_Ammo";
        displayName = CSTRING(Module_IEDLandSmall_Range_DisplayName);
    };

    // Zeus placed mines
    class ModuleMine_F;
    class ModuleMine_SLAMDirectionalMine_F: ModuleMine_F {
        displayName = CSTRING(Module_SLAMSideAttack_DisplayName);
    };
    class ACE_ModuleMine_SLAMBottomMine: ModuleMine_SLAMDirectionalMine_F {
        author = ECSTRING(common,aceteam);
        displayName = CSTRING(Module_SLAMBottomAttack_DisplayName);
        explosive = "ACE_SLAMDirectionalMine_Magnetic_Ammo";
        icon = "iconExplosiveGP";
    };
    class ModuleExplosive_IEDUrbanBig_F;
    class ACE_ModuleExplosive_IEDUrbanBig_Range: ModuleExplosive_IEDUrbanBig_F {
        author = ECSTRING(common,aceteam);
        displayName = CSTRING(Module_IEDUrbanBig_Range_DisplayName);
        explosive = "ACE_IEDUrbanBig_Range_Ammo";
    };
    class ModuleExplosive_IEDLandBig_F;
    class ACE_ModuleExplosive_IEDLandBig_Range: ModuleExplosive_IEDLandBig_F {
        author = ECSTRING(common,aceteam);
        displayName = CSTRING(Module_IEDLandBig_Range_DisplayName);
        explosive = "ACE_IEDLandBig_Range_Ammo";
    };
    class ModuleExplosive_IEDUrbanSmall_F;
    class ACE_ModuleExplosive_IEDUrbanSmall_Range: ModuleExplosive_IEDUrbanSmall_F {
        author = ECSTRING(common,aceteam);
        displayName = CSTRING(Module_IEDUrbanSmall_Range_DisplayName);
        explosive = "ACE_IEDUrbanSmall_Range_Ammo";
    };
    class ModuleExplosive_IEDLandSmall_F;
    class ACE_ModuleExplosive_IEDLandSmall_Range: ModuleExplosive_IEDLandSmall_F {
        author = ECSTRING(common,aceteam);
        displayName = CSTRING(Module_IEDLandSmall_Range_DisplayName);
        explosive = "ACE_IEDLandSmall_Range_Ammo";
    };
};

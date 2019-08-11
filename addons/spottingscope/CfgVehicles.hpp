
class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(place) {
                    displayName = CSTRING(Placedown);
                    condition = QUOTE([ARR_2(_player,'ACE_SpottingScope')] call EFUNC(common,hasItem));
                    statement = QUOTE([ARR_2(_player,'ACE_SpottingScope')] call FUNC(place));
                    showDisabled = 0;
                    icon = QPATHTOF(UI\w_spottingscope_ca.paa);
                };
            };
        };
    };

    class ThingX;
    class ACE_SpottingScope_Tube: ThingX {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(DisplayName);
        model = QPATHTOF(data\ace_spottingscope_tube.p3d);
    };

    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret;
        };

        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class ACE_SpottingScopeObject: StaticWeapon {
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,1,0};
        EGVAR(dragging,dragDirection) = 0;

        class ACE_Actions: ACE_Actions{
            class ACE_MainActions: ACE_MainActions {
                selection = "main_turret_axis";
                class ACE_Pickup {
                    selection = "";
                    displayName = CSTRING(PickUp);
                    distance = 5;
                    condition = QUOTE((alive _target) && (count (crew _target) == 0));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(pickup));
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = QPATHTOF(UI\w_spottingscope_ca.paa);
                };
            };
        };

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };

        CBA_ScriptedOpticClass = "ACE_SpottingScopeOptic";

        author = ECSTRING(common,ACETeam);
        scope = 1;
        side = 1;
        typicalCargo[] = {"Soldier"};
        displayName = CSTRING(DisplayName);
        model = QPATHTOF(data\ace_spottingscope.p3d);
        mapSize = 0.5;
        transportSoldier = 0;
        getInAction = "PlayerProne";
        getOutAction = "PlayerProne";
        editorSubcategory = "EdSubcat_Turrets";

        threat[] = {0.7, 0.3, 0};
        accuracy = 0.12;
        cost = 10000;
        icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";
        attenuationEffectType = "";

        class SpeechVariants {
            class Default {
                speechSingular[] = {"veh_infantry_SF_s"};
                speechPlural[] = {"veh_infantry_SF_p"};
            };
        };
        textSingular = "$STR_A3_nameSound_veh_infantry_SF_s";
        textPlural = "$STR_A3_nameSound_veh_infantry_SF_p";
        nameSound = "veh_infantry_SF_s";

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                minTurn = -45;
                maxTurn = 45;
                initTurn = 0;
                minElev = -10;
                maxElev = 40;
                initElev = 0;

                class ViewGunner {
                    initAngleX = 5;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.75;
                    minFov = 0.25;
                    maxFov = 1.25;
                };

                class ViewOptics {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    minFov = "0.25/35"; // real one is 15x-45x, but max mag in game is 37x
                    maxFov = "0.25/5";
                    initFov= "0.25/5";
                };

                weapons[] = {};
                magazines[] = {};
                gunnerOpticsColor[] = {1,1,1,1};
                gunnerOpticsModel = "\A3\Weapons_F\empty.p3d";
                gunnerOpticsEffect[] = {"OpticsCHAbera1","OpticsBlur2"};
                gunnerOutOpticsShowCursor = 0;
                gunnerOpticsShowCursor = 0;
                gunnerAction = "ACE_SpottingScope";
                gunnerGetInAction = "PlayerProne";
                gunnerGetOutAction = "PlayerProne";
                gunnerForceOptics = 0;
                ejectDeadGunner = 0;
                turretInfoType = "CBA_ScriptedOptic_zooming";
                opticsDisablePeripherialVision = 1;
            };
        };

        // damage handling
        armor = 80;

        class Damage {
            tex[] = {};
            mat[] = {
                QPATHTO_R(data\ace_spottingscope_metal.rvmat),
                QPATHTO_R(data\ace_spottingscope_metal_damage.rvmat),
                QPATHTO_R(data\ace_spottingscope_metal_destruct.rvmat),
                QPATHTO_R(data\ace_spottingscope_glass.rvmat),
                QPATHTO_R(data\ace_spottingscope_glass_damage.rvmat),
                QPATHTO_R(data\ace_spottingscope_glass_destruct.rvmat),
                QPATHTO_R(data\ace_spottingscope_rubber.rvmat),
                QPATHTO_R(data\ace_spottingscope_rubber_damage.rvmat),
                QPATHTO_R(data\ace_spottingscope_rubber_damage.rvmat)
            };
        };

        editorPreview = QPATHTOF(data\preview_spottingscope.jpg);
    };

    class ACE_B_SpottingScope: ACE_SpottingScopeObject {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_B_SpottingScope";
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_spotter_F";
    };

    class ACE_O_SpottingScope: ACE_SpottingScopeObject {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_O_SpottingScope";
        scope = 2;
        side = 0;
        faction = "OPF_F";
        crew = "O_spotter_F";
    };

    class ACE_I_SpottingScope: ACE_SpottingScopeObject {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_I_SpottingScope";
        scope = 2;
        side = 2;
        faction = "IND_F";
        crew = "I_spotter_F";
    };

    class ACE_B_T_SpottingScope: ACE_SpottingScopeObject {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_B_T_SpottingScope";
        scope = 2;
        side = 1;
        faction = "BLU_T_F";
        crew = "B_T_Spotter_F";
    };

    class ACE_O_T_SpottingScope: ACE_SpottingScopeObject {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_O_T_SpottingScope";
        scope = 2;
        side = 0;
        faction = "OPF_T_F";
        crew = "O_T_Spotter_F";
    };

    class Item_Base_F;
    class ACE_Item_SpottingScope: Item_Base_F {
        author[] = {"Rocko", "Scubaman3D"};
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(DisplayName);
        vehicleClass = "Items";
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        editorPreview = QPATHTOF(data\preview_spottingscope.jpg);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpottingScope,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpottingScope,2);
        };
    };
};

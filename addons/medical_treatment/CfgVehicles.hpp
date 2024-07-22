class CBA_Extended_EventHandlers;
class CfgVehicles {
    // Bodybag vehicle
    class MapBoard_altis_F;
    class ACE_bodyBagObject: MapBoard_altis_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        displayName = "$STR_a3_cfgvehicles_land_bodybag_01_black_f0";
        scope = 1;
        scopeCurator = 1;
        side = -1;
        icon = "";
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,1.2,0};
        EGVAR(dragging,dragDirection) = 0;
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;
        EGVAR(cargo,noRename) = 1;
        model = "\A3\Props_F_Orange\Humanitarian\Camps\Bodybag_01_F.p3d";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\A3\Props_F_Orange\Humanitarian\Camps\Data\Bodybag_01_black_CO.paa"};
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                distance = 5;
                condition = QUOTE(true);
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
                selection = "";
                class GVAR(buryBodyBag) {
                    displayName = CSTRING(DigGrave);
                    condition = QUOTE([ARR_2(_this#1,_this#0)] call FUNC(canDigGrave));
                    statement = QUOTE(_this call FUNC(placeBodyBagInGrave));
                    icon = QPATHTOEF(medical_gui,ui\grave.paa);
                };
            };
        };
    };
    class ACE_bodyBagObject_blue: ACE_bodyBagObject {
        displayName = "$STR_a3_cfgvehicles_land_bodybag_01_blue_f0";
        hiddenSelectionsTextures[] = {"\A3\Props_F_Orange\Humanitarian\Camps\Data\Bodybag_01_blue_CO.paa"};
    };
    class ACE_bodyBagObject_white: ACE_bodyBagObject {
        displayName = "$STR_a3_cfgvehicles_land_bodybag_01_white_f0";
        hiddenSelectionsTextures[] = {"\A3\Props_F_Orange\Humanitarian\Camps\Data\Bodybag_01_white_CO.paa"};
    };
    class ACE_bodyBagObject_old: ACE_bodyBagObject {
        displayName = CSTRING(Bodybag_Display);
        model = QPATHTOEF(apl,ace_bodybag.p3d);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOEF(apl,data\bodybag_co.paa)};
    };

    // Grave vehicle
    class Land_Grave_dirt_F;
    class ACE_Grave: Land_Grave_dirt_F {
        model = QPATHTOF(data\ACE_grave.p3d);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\Grave_co.paa)};
    };


    // Medical litter classes
    class Thing;
    class ACE_MedicalLitterBase: Thing {
        scope = 1;
        scopeCurator = 0;
        displayName = " ";
        destrType = "DestructNo";
        model = QPATHTOF(data\littergeneric.p3d);
    };
    class ACE_MedicalLitter_clean: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_clean.p3d);
    };
    class ACE_MedicalLitter_bandage1: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_bandages1.p3d);
    };
    class ACE_MedicalLitter_bandage2: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_bandages2.p3d);
    };
    class ACE_MedicalLitter_bandage3: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_bandages3.p3d);
    };
    class ACE_MedicalLitter_packingBandage: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_packingBandage.p3d);
    };
    class ACE_MedicalLitter_gloves: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_gloves.p3d);
    };
    class ACE_MedicalLitter_adenosine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_adenosine.p3d);
    };
    class ACE_MedicalLitter_atropine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_atropine.p3d);
    };
    class ACE_MedicalLitter_epinephrine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_epinephrine.p3d);
    };
    class ACE_MedicalLitter_morphine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_morphine.p3d);
    };
    class ACE_MedicalLitter_QuickClot: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_Quikclot.p3d);
    };
    class ACE_MedicalLitter_splint: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_splint.p3d);
    };
    class ACE_MedicalLitter_suture: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_suture.p3d);
    };

    // Treatment items
    class Item_Base_F;
    class ACE_fieldDressingItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bandage_Basic_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,1);
        };
    };
    class ACE_packingBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Packing_Bandage_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_packingBandage,1);
        };
    };
    class ACE_elasticBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bandage_Elastic_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_elasticBandage,1);
        };
    };
    class ACE_tourniquetItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Tourniquet_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_tourniquet,1);
        };
    };
    class ACE_splintItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(splint_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_splint,1);
        };
    };
    class ACE_morphineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Morphine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_morphine,1);
        };
    };
    class ACE_adenosineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Adenosine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_adenosine,1);
        };
    };
    class ACE_atropineItem: Item_Base_F {
        scope = 1;
        scopeCurator = 1;
        displayName = CSTRING(Atropine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_atropine,1);
        };
    };
    class ACE_epinephrineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Epinephrine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_epinephrine,1);
        };
    };
    class ACE_plasmaIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Plasma_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_plasmaIV,1);
        };
    };

    class ACE_bloodIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Blood_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_bloodIV,1);
        };
    };
    class ACE_salineIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Saline_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_salineIV,1);
        };
    };
    class ACE_quikClotItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(QuikClot_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_quikclot,1);
        };
    };
    class ACE_personalAidKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Aid_Kit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_personalAidKit,1);
        };
    };
    class ACE_surgicalKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(SurgicalKit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_surgicalKit,1);
        };
    };
    class ACE_sutureItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Suture_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_suture,1);
        };
    };
    class ACE_bodyBagItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bodybag_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_bodyBag,1);
        };
    };
    class ACE_painkillersItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(painkillers_Display);
        author = "Alganthe";
        vehicleClass = "Items";
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_painkillers,1);
        };
    };

    // Medical supply crates
    class ThingX;
    class ReammoBox_F: ThingX {
        class ACE_Actions;
    };
    class NATO_Box_Base: ReammoBox_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };
    class ACE_medicalSupplyCrate: NATO_Box_Base {
        scope = 2;
        scopeCurator = 2;
        accuracy = 1000;
        displayName = CSTRING(medicalSupplyCrate);
        model = QPATHTOF(data\ace_medcrate.p3d);
        editorPreview = QPATHTOF(data\ACE_medicalSupplyCrate.jpg);
        author = ECSTRING(common,ACETeam);
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_painkillers,25);
        };
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,50);
            MACRO_ADDITEM(ACE_morphine,25);
            MACRO_ADDITEM(ACE_epinephrine,25);
            MACRO_ADDITEM(ACE_bloodIV,15);
            MACRO_ADDITEM(ACE_bloodIV_500,15);
            MACRO_ADDITEM(ACE_bloodIV_250,15);
            MACRO_ADDITEM(ACE_tourniquet,10);
            MACRO_ADDITEM(ACE_splint,10);
            MACRO_ADDITEM(ACE_bodyBag,10);
        };
        class AnimationSources {
            class Cover {
                source = "user";
                animPeriod = 1.5;
                initPhase = 0;
                minValue = 0;
                maxValue = 1;
            };
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                selection = "cover_action";

                class ACE_OpenLid {
                    displayName = ECSTRING(medical,openLid);
                    condition = QUOTE(alive _target && {_target animationPhase 'Cover' < 0.5});
                    statement = QUOTE(_target animate [ARR_2('Cover',1)]);
                    showDisabled = 0;
                    priority = -1;
                };
                class ACE_CloseLid {
                    displayName = ECSTRING(medical,closeLid);
                    condition = QUOTE(alive _target && {_target animationPhase 'Cover' >= 0.5});
                    statement = QUOTE(_target animate [ARR_2('Cover',0)]);
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };
    class ACE_medicalSupplyCrate_advanced: ACE_medicalSupplyCrate {
        displayName = CSTRING(medicalSupplyCrate_advanced);
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_painkillers,15);
        };
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,25);
            MACRO_ADDITEM(ACE_packingBandage,25);
            MACRO_ADDITEM(ACE_elasticBandage,25);
            MACRO_ADDITEM(ACE_tourniquet,15);
            MACRO_ADDITEM(ACE_splint,15);
            MACRO_ADDITEM(ACE_morphine,15);
            MACRO_ADDITEM(ACE_adenosine,15);
            MACRO_ADDITEM(ACE_epinephrine,15);
            MACRO_ADDITEM(ACE_plasmaIV,7);
            MACRO_ADDITEM(ACE_plasmaIV_500,7);
            MACRO_ADDITEM(ACE_plasmaIV_250,7);
            MACRO_ADDITEM(ACE_salineIV,7);
            MACRO_ADDITEM(ACE_salineIV_500,7);
            MACRO_ADDITEM(ACE_salineIV_250,7);
            MACRO_ADDITEM(ACE_bloodIV,7);
            MACRO_ADDITEM(ACE_bloodIV_500,7);
            MACRO_ADDITEM(ACE_bloodIV_250,7);
            MACRO_ADDITEM(ACE_quikClot,20);
            MACRO_ADDITEM(ACE_personalAidKit,3);
            MACRO_ADDITEM(ACE_surgicalKit,2);
            MACRO_ADDITEM(ACE_bodyBag,5);
            MACRO_ADDITEM(ACE_suture,60);
        };
    };

    class Van_02_base_F;
    class Van_02_medevac_base_F: Van_02_base_F {
        GVAR(patientSeats)[] = {3,4};
    };

    class Heli_Transport_04_base_F;
    class O_Heli_Transport_04_medevac_F: Heli_Transport_04_base_F {
        GVAR(patientSeats)[] = {0,1,2};
    };
};

class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(digEnvelopeSmall) {
                    displayName = CSTRING(DigEnvelopeSmall);
                    condition = QUOTE(_player call FUNC(canDigTrench));
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_small')])] call CBA_fnc_execNextFrame);
                    exceptions[] = {};
                    showDisabled = 0;
                    priority = 4;
                    //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                };
                class GVAR(digEnvelopeBig): GVAR(digEnvelopeSmall) {
                    displayName = CSTRING(DigEnvelopeBig);
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_big')])] call CBA_fnc_execNextFrame);
                };
                class GVAR(DigEnvelopeGigant): GVAR(digEnvelopeSmall) {
                    displayName = CSTRING(DigEnvelopeGigant);
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_gigant')])] call CBA_fnc_execNextFrame);
                };
                class GVAR(DigEnvelopeVehicle): GVAR(digEnvelopeSmall) {
                    displayName = CSTRING(DigEnvelopeVehicle);
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_vehicle')])] call CBA_fnc_execNextFrame);
                };
            };
        };
    };

    class BagFence_base_F;
    class ACE_envelope_small: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeSmallName);
        descriptionShort = CSTRING(EnevlopeSmallDescription);
        model = QPATHTOEF(apl,ace_envelope_small4.p3d);
        scope = 2;
        GVAR(diggingDuration) = 20;
        GVAR(removalDuration) = 12;
        GVAR(noGeoClass) = QUOTE(ACE_envelope_small_NoGeo);
        GVAR(placementData)[] = {2,3,0.35};
        GVAR(grassCuttingPoints)[] = {{0,-0.5,0}};
        GVAR(isTrench) = 1;
        editorCategory = "EdCat_Things";
        editorSubcategory = "EdSubcat_Military";

        class CamouflagePositions {
            center[] = {0, 1.3, 0};
            left[] = {1.3, -0.8, 0.4};
            right[] = {-1.3,-0.8,0.4};
        };

        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                selection = "";
                distance = 3;
                condition = QUOTE(true);
                class GVAR(continueDigging) {
                    displayName = CSTRING(ContinueDiggingTrench);
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(continueDiggingTrench););
                    priority = -1;
                };
                class GVAR(remove) {
                    displayName = CSTRING(RemoveEnvelope);
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canRemoveTrench));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(removeTrench););
                    priority = -1;
                };
            };
        };

        class Attributes {
            class GVAR(camouflageAttribute) {
                control = "CheckboxNumber";
                defaultValue = "0";
                displayName = CSTRING(CamouflageAttribute);
                tooltip = CSTRING(CamouflageAttributeTooltip);
                expression = QUOTE([ARR_2(_this,_value)] call FUNC(applyCamouflageAttribute));
                property = QUOTE(ACE_trenches_camouflageTrench);
            };
        };

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class ACE_envelope_big: ACE_envelope_small {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnevlopeBigDescription);
        model = QPATHTOEF(apl,ace_envelope_big4.p3d);
        GVAR(diggingDuration) = 25;
        GVAR(removalDuration) = 15;
        GVAR(noGeoClass) = QUOTE(ACE_envelope_big_NoGeo);
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};

        class CamouflagePositions {
            center[] = {-0.4, 0.4, 0.2};
            left[] = {-1.75, 0.2, 0.2};
            right[] = {1.75, 0.2, 0.2};
        };
    };
    class ACE_envelope_gigant: ACE_envelope_small {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeGigantName);
        descriptionShort = CSTRING(EnevlopeGigantDescription);
        ace_trenches_diggingDuration = 30;
        ace_trenches_removalDuration = 20;
        ace_trenches_noGeoClass = QUOTE(ACE_envelope_gigant_noGeo);
        ace_trenches_placementData[] = {6,1.1,0.20};
        ace_trenches_grassCuttingPoints[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_gigant.p3d);

        class CamouflagePositions {
            left1[] = {-0.5, 0.3, 0.5};
            left2[] = {-2.7, 0.3, 0.5};
            right1[] = {2.7, 0.15, 0.35};
            right2[] = {4.9, -0.5, -0.15};
        };
    };
    class ACE_envelope_vehicle: ACE_envelope_small {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeVehicleName);
        descriptionShort = CSTRING(EnevlopeVehicleDescription);
        ace_trenches_diggingDuration = 60;
        ace_trenches_removalDuration = 30;
        ace_trenches_noGeoClass = QUOTE(ACE_envelope_vehicle_noGeo);
        ace_trenches_placementData[] = {6,1.1,0.20};
        ace_trenches_grassCuttingPoints[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_vehicle.p3d);

        class CamouflagePositions {};
        class Attributes {};
    };

    class ACE_envelope_small_NoGeo: ACE_envelope_small {
        scope = 1;
        model = QPATHTOEF(apl,ace_envelope_small4_nogeo.p3d);
    };
    class ACE_envelope_big_NoGeo: ACE_envelope_big {
        scope = 1;
        model = QPATHTOEF(apl,ace_envelope_big4_nogeo.p3d);
    };
    class ACE_envelope_gigant_NoGeo: ACE_envelope_gigant {
        scope = 1;
        model = QPATHTOF(data\trench_gigant_nogeo.p3d);
    };
    class ACE_envelope_vehicle_NoGeo: ACE_envelope_vehicle {
        scope = 1;
        model = QPATHTOF(data\trench_vehicle_nogeo.p3d);
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EntrenchingTool,50);
        };
    };
};

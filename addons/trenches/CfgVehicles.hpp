class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_Trenches {
                    displayName = CSTRING(ActionCategory);
                    condition = QUOTE(true);
                    statement = "";
                    exceptions[] = {};
                    showDisabled = 1;
                    priority = 4;
                    class GVAR(digEnvelopeSmall) {
                        displayName = CSTRING(DigEnvelopeSmall);
                        condition = QUOTE(_player call FUNC(canDigTrench) && && GVAR(allowSmallEnvelope));
                        //wait a frame to handle "Do When releasing action menu key" option
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_small')])] call CBA_fnc_execNextFrame);
                        exceptions[] = {};
                        showDisabled = 0;
                        priority = 4;
                        //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                    };
                    class GVAR(digEnvelopeBig): GVAR(digEnvelopeSmall) {
                        displayName = CSTRING(DigEnvelopeBig);
                        condition = QUOTE(_player call FUNC(canDigTrench) && && GVAR(allowBigEnvelope));
                        //wait a frame to handle "Do When releasing action menu key" option
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_big')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(DigEnvelopeGigant): GVAR(digEnvelopeSmall) {
                        displayName = CSTRING(DigEnvelopeGigant);
                        condition = QUOTE(_player call FUNC(canDigTrench) && && GVAR(allowGigantEnvelope));
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_gigant')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(DigEnvelopeVehicle): GVAR(digEnvelopeSmall) {
                        displayName = CSTRING(DigEnvelopeVehicle);
                        condition = QUOTE(_player call FUNC(canDigTrench) && && GVAR(allowVehicleEnvelope));
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_vehicle')])] call CBA_fnc_execNextFrame);
                    };
                };
            };
        };
    };

    class BagFence_base_F;
    class ACE_envelope_small: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeSmallName);
        descriptionShort = CSTRING(EnevlopeSmallDescription);
        model = QPATHTOF(data\trench_small.p3d);
        scope = 2;
        scopeCurator = 2;
        GVAR(diggingDuration) = QGVAR(smallEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(smallEnvelopeRemovalTime);
        GVAR(noGeoClass) = "ACE_envelope_small_NoGeo";
        GVAR(placementData)[] = {2,3,0.35};
        GVAR(grassCuttingPoints)[] = {{0,-0.5,0}};

        editorCategory = "EdCat_Things";
        editorSubcategory = "EdSubcat_Military";
        hiddenSelections[] = {"velka"};

        class GVAR(camouflagePositions) {
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
                    displayName = CSTRING(continueDiggingTrench);
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(continueDiggingTrench););
                    priority = -1;
                };
                class GVAR(remove) {
                    displayName = CSTRING(removeEnvelope);
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canRemoveTrench));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(removeTrench););
                    priority = -1;
                };
                class GVAR(placeCamouflage) {
                    displayName = CSTRING(placeCamouflage);
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canPlaceCamouflage));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(placeCamouflage));
                    priority = -1;
                };
                class GVAR(removeCamouflage) {
                    displayName = CSTRING(removeCamouflage);
                    condition = QUOTE([_target] call FUNC(canRemoveCamouflage));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(removeCamouflage));
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
                property = CAMOUFLAGE_3DEN_ATTRIBUTE;
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
        model = QPATHTOF(data\trench_big.p3d);
        GVAR(diggingDuration) = QGVAR(bigEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(bigEnvelopeRemovalTime);
        GVAR(noGeoClass) = "ACE_envelope_big_NoGeo";
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};

        class GVAR(camouflagePositions) {
            center[] = {-0.4, 0.4, 0.2};
            left[] = {-1.75, 0.2, 0.2};
            right[] = {1.75, 0.2, 0.2};
        };
    };
    class ACE_envelope_gigant: ACE_envelope_small {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeGigantName);
        descriptionShort = CSTRING(EnevlopeGigantDescription);
        GVAR(diggingDuration) = QGVAR(gigantEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(gigantEnvelopeRemovalTime);
        GVAR(noGeoClass) = "ACE_envelope_gigant_noGeo";
        GVAR(placementData)[] = {15,1.1,0.40};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_gigant.p3d);

        class GVAR(camouflagePositions) {
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
        GVAR(diggingDuration) = QGVAR(vehicleEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(vehicleEnvelopeRemovalTime);
        GVAR(noGeoClass) = "ACE_envelope_vehicle_noGeo";
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_vehicle.p3d);

        class GVAR(camouflagePositions) {};
        class Attributes {};
    };

    class ACE_envelope_small_NoGeo: ACE_envelope_small {
        scope = 1;
        scopeCurator = 0;
        model = QPATHTOF(data\trench_small_nogeo.p3d);
    };
    class ACE_envelope_big_NoGeo: ACE_envelope_big {
        scope = 1;
        scopeCurator = 0;
        model = QPATHTOF(data\trench_big_nogeo.p3d);
    };
    class ACE_envelope_gigant_NoGeo: ACE_envelope_gigant {
        scope = 1;
        scopeCurator = 0;
        model = QPATHTOF(data\trench_gigant_nogeo.p3d);
    };
    class ACE_envelope_vehicle_NoGeo: ACE_envelope_vehicle {
        scope = 1;
        scopeCurator = 0;
        model = QPATHTOF(data\trench_vehicle_nogeo.p3d);
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EntrenchingTool,50);
        };
    };
};

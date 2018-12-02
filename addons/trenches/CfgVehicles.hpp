class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_Trenches {
                    displayName = CSTRING(ActionCategory);
                    condition = QUOTE(_player call FUNC(canDigTrench) && GVAR(allowDigging));
                    statement = "";
                    showDisabled = 0;
                    priority = 3;
                    // icon = "z\ace\addons\trenches\UI\w_entrchtool_ca.paa";
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    class GVAR(digEnvelopeShort) {
                       displayName = CSTRING(DigEnvelopeShort);
                       condition = QUOTE(GVAR(allowDigging) && ([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)) && GVAR(allowShortEnvelope));
                       //wait a frame to handle "Do When releasing action menu key" option
                       statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_short')])] call CBA_fnc_execNextFrame);
                       exceptions[] = {};
                       showDisabled = 0;
                       priority = 4;
                       //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                    };
                    class GVAR(digEnvelopeSmall): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeSmall);
                        condition = QUOTE(GVAR(allowDigging) && ([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)) && GVAR(allowSmallEnvelope));
                        //wait a frame to handle "Do When releasing action menu key" option
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_small')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(digEnvelopeBig): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeBig);
                        condition = QUOTE(GVAR(allowDigging) && ([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)) && GVAR(allowBigEnvelope));
                        //wait a frame to handle "Do When releasing action menu key" option
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_big')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(DigEnvelopeGiant): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeGiant);
                        condition = QUOTE(_player call FUNC(canDigTrench) && ([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)) && GVAR(allowGiantEnvelope));
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_giant')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(DigEnvelopeVehicle): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeVehicle);
                        condition = QUOTE(_player call FUNC(canDigTrench) && ([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)) && GVAR(allowVehicleEnvelope));
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
        GVAR(placementData)[] = {2,3,0.35};
        GVAR(grassCuttingPoints)[] = {{0,-0.5,0}};
        GVAR(boundingBoxOffset) = "0.16";

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
                class GVAR(helpDigging) {
                    displayName = CSTRING(HelpDigging); \
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canHelpDiggingTrench));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(addDigger));
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
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnevlopeBigDescription);
        model = QPATHTOF(data\trench_big.p3d);
        GVAR(diggingDuration) = QGVAR(bigEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(bigEnvelopeRemovalTime);
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        GVAR(boundingBoxOffset) = "0.197";

        class GVAR(camouflagePositions) {
            center[] = {-0.4, 0.4, 0.2};
            left[] = {-1.75, 0.2, 0.2};
            right[] = {1.75, 0.2, 0.2};
        };
    };
    class ACE_envelope_giant: ACE_envelope_small {
        displayName = CSTRING(EnvelopeGiantName);
        descriptionShort = CSTRING(EnevlopeGiantDescription);
        GVAR(diggingDuration) = QGVAR(giantEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(giantEnvelopeRemovalTime);
        GVAR(placementData)[] = {15,1.1,0.40};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_giant.p3d);
        GVAR(boundingBoxOffset) = 0.557;

        class GVAR(camouflagePositions) {
            left1[] = {-0.5, 0.3, 0.5};
            left2[] = {-2.7, 0.3, 0.5};
            right1[] = {2.7, 0.15, 0.35};
            right2[] = {4.9, -0.5, -0.15};
        };
    };
    class ACE_envelope_vehicle: ACE_envelope_small {
        displayName = CSTRING(EnvelopeVehicleName);
        descriptionShort = CSTRING(EnevlopeVehicleDescription);
        GVAR(diggingDuration) = QGVAR(vehicleEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(vehicleEnvelopeRemovalTime);
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_vehicle.p3d);
        GVAR(boundingBoxOffset) = "0.34";

        class GVAR(camouflagePositions) {};
        class Attributes {};
    };

    class ACE_envelope_short: ACE_envelope_small {
        displayName = CSTRING(EnvelopeShortName);
        descriptionShort = CSTRING(EnevlopeShortDescription);
        GVAR(diggingDuration) = QGVAR(shortEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(shortEnvelopeRemovalTime);
        GVAR(placementData)[] = {10,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_short.p3d);
        GVAR(boundingBoxOffset) = "0.16";

        class GVAR(camouflagePositions) {
            right[] = {1.1,0.2,0.2};
            left[] = {-1.1,0.1,0.2};
        };
        class Attributes {};
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EntrenchingTool,50);
        };
    };
};

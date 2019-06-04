class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(ActionCategory);
                    condition = QUOTE(_player call FUNC(canDigTrench) && GVAR(allowDigging));
                    statement = "";
                    showDisabled = 0;
                    // icon = "z\ace\addons\trenches\UI\w_entrchtool_ca.paa";
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    class GVAR(digEnvelopeShort) {
                       displayName = CSTRING(DigEnvelopeShort);
                       condition = QUOTE(GVAR(allowDigging) && (_this call FUNC(canContinueDiggingTrench)) && GVAR(allowShortEnvelope));
                       //wait a frame to handle "Do When releasing action menu key" option
                       statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_short')])] call CBA_fnc_execNextFrame);
                       exceptions[] = {};
                       showDisabled = 0;
                       //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                    };
                    class GVAR(digEnvelopeSmall): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeSmall);
                        condition = QUOTE(GVAR(allowDigging) && (_this call FUNC(canContinueDiggingTrench)) && GVAR(allowSmallEnvelope));
                        //wait a frame to handle "Do When releasing action menu key" option
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_small')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(digEnvelopeBig): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeBig);
                        condition = QUOTE(GVAR(allowDigging) && (_this call FUNC(canContinueDiggingTrench)) && GVAR(allowBigEnvelope));
                        //wait a frame to handle "Do When releasing action menu key" option
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_big')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(DigEnvelopeLarge): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeLarge);
                        condition = QUOTE(_player call FUNC(canDigTrench) && (_this call FUNC(canContinueDiggingTrench)) && GVAR(allowLargeEnvelope));
                        statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_huge')])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(DigEnvelopeVehicle): GVAR(digEnvelopeShort) {
                        displayName = CSTRING(DigEnvelopeVehicle);
                        condition = QUOTE(_player call FUNC(canDigTrench) && (_this call FUNC(canContinueDiggingTrench)) && GVAR(allowVehicleEnvelope));
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
        descriptionShort = CSTRING(EnvelopeSmallDescription);
        model = QPATHTOF(data\trench_small.p3d);
        scope = 2;
        GVAR(diggingDuration) = QGVAR(smallEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(smallEnvelopeRemovalTime);
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
                    condition = QUOTE(_this call FUNC(canContinueDiggingTrench));
                    statement = QUOTE(_this call FUNC(continueDiggingTrench););
                };
                class GVAR(helpDigging) {
                    displayName = CSTRING(HelpDigging);
                    condition = QUOTE(_this call FUNC(canHelpDiggingTrench));
                    statement = QUOTE(_this call FUNC(handleDiggingServer));
                };
                class GVAR(remove) {
                    displayName = CSTRING(removeEnvelope);
                    condition = QUOTE(_this call FUNC(canRemoveTrench));
                    statement = QUOTE(_this call FUNC(removeTrench););
                };
                class GVAR(placeCamouflage) {
                    displayName = CSTRING(placeCamouflage);
                    condition = QUOTE(_this call FUNC(canPlaceCamouflage));
                    statement = QUOTE(_this call FUNC(placeCamouflage));
                };
                class GVAR(removeCamouflage) {
                    displayName = CSTRING(removeCamouflage);
                    condition = QUOTE([_target] call FUNC(canRemoveCamouflage));
                    statement = QUOTE(_this call FUNC(removeCamouflage));
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
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };

        class AnimationSources {
            class hide_trench {
                source = "user";
                animPeriod = 0.0001;
                initPhase = 1;
            };
        };
    };
    class ACE_envelope_big: ACE_envelope_small {
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnvelopeBigDescription);
        model = QPATHTOF(data\trench_big.p3d);
        GVAR(diggingDuration) = QGVAR(bigEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(bigEnvelopeRemovalTime);
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};

        class GVAR(camouflagePositions) {
            center[] = {-0.4, 0.4, 0.2};
            left[] = {-1.75, 0.2, 0.2};
            right[] = {1.75, 0.2, 0.2};
        };
    };
    class ACE_envelope_huge: ACE_envelope_small {
        displayName = CSTRING(EnvelopeLargeName);
        descriptionShort = CSTRING(EnvelopeLargeDescription);
        GVAR(diggingDuration) = QGVAR(largeEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(largeEnvelopeRemovalTime);
        GVAR(placementData)[] = {15,1.1,0.40};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_huge.p3d);

        class GVAR(camouflagePositions) {
            left1[] = {-0.5, 0.3, 0.5};
            left2[] = {-2.7, 0.3, 0.5};
            right1[] = {2.7, 0.15, 0.35};
            right2[] = {4.9, -0.5, -0.15};
        };
    };
    class ACE_envelope_vehicle: ACE_envelope_small {
        displayName = CSTRING(EnvelopeVehicleName);
        descriptionShort = CSTRING(EnvelopeVehicleDescription);
        GVAR(diggingDuration) = QGVAR(vehicleEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(vehicleEnvelopeRemovalTime);
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_vehicle.p3d);

        class GVAR(camouflagePositions) {};
        class Attributes {};
    };

    class ACE_envelope_short: ACE_envelope_small {
        displayName = CSTRING(EnvelopeShortName);
        descriptionShort = CSTRING(EnvelopeShortDescription);
        GVAR(diggingDuration) = QGVAR(shortEnvelopeDigTime);
        GVAR(removalDuration) = QGVAR(shortEnvelopeRemovalTime);
        GVAR(placementData)[] = {10,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        model = QPATHTOF(data\trench_short.p3d);

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

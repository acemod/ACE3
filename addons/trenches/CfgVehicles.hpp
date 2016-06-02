class CBA_Extended_EventHandlers;

#define ACE_TRENCHES_ACTIONS class ACE_Actions { \
        class ACE_MainActions { \
            displayName = ECSTRING(interaction,MainAction); \
            selection = ""; \
            distance = 3; \
            condition = QUOTE(true); \
            class ACE_ContinueDiggingTrench { \
                displayName = CSTRING(ContinueDiggingTrench); \
                condition = QUOTE([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)); \
                statement = QUOTE([ARR_2(_target,_player)] call FUNC(continueDiggingTrench);); \
                priority = -1; \
            }; \
            class ACE_RemoveTrench { \
                displayName = CSTRING(RemoveEnvelope); \
                condition = QUOTE([ARR_2(_target,_player)] call FUNC(canRemoveTrench)); \
                statement = QUOTE([ARR_2(_target,_player)] call FUNC(removeTrench);); \
                priority = -1; \
            }; \
        }; \
    }

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
                class GVAR(digEnvelopeBig) {
                    displayName = CSTRING(DigEnvelopeBig);
                    condition = QUOTE(_player call FUNC(canDigTrench));
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_big')])] call CBA_fnc_execNextFrame);
                    exceptions[] = {};
                    showDisabled = 0;
                    priority = 4;
                    //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
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
        GVAR(noGeoClass) = "ACE_envelope_small_NoGeo";
        GVAR(placementData)[] = {2,3,0.35};
        GVAR(grassCuttingPoints)[] = {{0,-0.5,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class ACE_envelope_big: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnevlopeBigDescription);
        model = QPATHTOEF(apl,ace_envelope_big4.p3d);
        scope = 2;
        GVAR(diggingDuration) = 25;
        GVAR(removalDuration) = 15;
        GVAR(noGeoClass) = "ACE_envelope_big_NoGeo";
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };

    class ACE_envelope_small_NoGeo: ACE_envelope_small {
        scope = 1;
        //@todo: replace by a no geo model
        model = QPATHTOEF(apl,ace_envelope_small4_nogeo.p3d);
    };
    class ACE_envelope_big_NoGeo: ACE_envelope_big {
        scope = 1;
        //@todo: replace by a no geo model
        model = QPATHTOEF(apl,ace_envelope_big4_nogeo.p3d);
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EntrenchingTool,50);
        };
    };
};

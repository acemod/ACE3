class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(digEnvelopeSmall) {
                    displayName = CSTRING(DigEnvelopeSmall);
                    condition = QUOTE([ARR_2(_this select 0,'ace_trenches_trenchSmall')] call FUNC(canDigTrench));
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ace_trenches_trenchSmall')])] call EFUNC(common,execNextFrame));
                    exceptions[] = {};
                    showDisabled = 0;
                    priority = 4;
                    //icon = PATHTOF(UI\icon_sandbag_ca.paa);
                };
                class GVAR(digEnvelopeBig) {
                    displayName = CSTRING(DigEnvelopeBig);
                    condition = QUOTE([ARR_2(_this select 0,'ace_trenches_trenchBig')] call FUNC(canDigTrench));
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ace_trenches_trenchBig')])] call EFUNC(common,execNextFrame));
                    exceptions[] = {};
                    showDisabled = 0;
                    priority = 4;
                    //icon = PATHTOF(UI\icon_sandbag_ca.paa);
                };
            };
        };
    };

    class BagFence_base_F;
    class ACE_envelope_small: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeSmallName);
        descriptionShort = CSTRING(EnevlopeSmallDescription);
        model = QUOTE(PATHTOEF(apl,ace_envelope_small4.p3d));
        scope = 2;
    };
    class ACE_envelope_big: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnevlopeBigDescription);
        model = QUOTE(PATHTOEF(apl,ace_envelope_big4.p3d));
        scope = 2;
    };


    class ACE_envelope_small_NoGeo: ACE_envelope_small {
        scope = 1;
        //@todo: replace by a no geo model
        model = QUOTE(PATHTOEF(apl,ace_envelope_small4_nogeo.p3d));
    };
    class ACE_envelope_big_NoGeo: ACE_envelope_big {
        scope = 1;
        //@todo: replace by a no geo model
        model = QUOTE(PATHTOEF(apl,ace_envelope_big4_nogeo.p3d));
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EntrenchingTool,50);
        };
    };
};

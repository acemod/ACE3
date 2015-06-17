class CfgVehicles {
    class BagFence_base_F;
    class ACE_envelope_small: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeSmallName);
        descriptionShort = CSTRING(EnevlopeSmallDescription);
        model = QUOTE(PATHTOF(data\ace_envelope_small.p3d));
        scope = 2;
    };
    class ACE_envelope_big: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnevlopeBigDescription);
        model = QUOTE(PATHTOF(data\ace_envelope_big.p3d));
        scope = 2;
    };
};
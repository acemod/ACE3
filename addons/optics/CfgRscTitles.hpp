
class RscOpticsValue;
class RscMapControl;
class RscText;

class RscInGameUI {
    class RscUnitInfo;
    class RscWeaponZeroing: RscUnitInfo {
        class CA_Zeroing;
    };

    class ACE_RscWeaponZeroing: RscWeaponZeroing {
        controls[] = {"CA_Zeroing","CA_FOVMode","ACE_DrawReticleHelper","ACE_ScriptedReticle"};

        class CA_Zeroing: CA_Zeroing {};

        class CA_FOVMode: RscOpticsValue {  // idea by Taosenai. Apparently this can be used via isNil check to determine wheter the scope or the kolimator is used
            idc = 154;
            style = 2;
            colorText[] = {0,0,0,0};
            x = 0;
            y = 0;
            w = 0;
            h = 0;
        };

        class ACE_DrawReticleHelper: RscMapControl {
            onDraw = QUOTE([ctrlParent (_this select 0)] call DFUNC(onDrawScope));
            idc = -1;
            w = 0;
            h = 0;
        };

        class ACE_ScriptedReticle: RscText {
            idc = 1713154;
            style = 48;
            size = 1;
            sizeEx = 0;
            text = QUOTE(PATHTOF(reticles\ace_shortdot_reticle_1.paa));
            w = 0;
            h = 0;
        };
    };
};

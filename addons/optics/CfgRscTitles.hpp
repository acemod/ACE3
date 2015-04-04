
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

    class ACE_RscWeaponZeroingPIP: ACE_RscWeaponZeroing {
        controls[] = {"CA_Zeroing","CA_FOVMode","ACE_DrawReticleHelper","ReticleDay","ReticleNight","BodyNight","BodyDay"}; // don't change this order

        class ACE_DrawReticleHelper: ACE_DrawReticleHelper {
            onDraw = QUOTE([ctrlParent (_this select 0)] call DFUNC(onDrawScopePIP));
        };

        #define SIZEX 0.76/(getResolution select 5)
        class ReticleDay: RscText {
            idc = 1713001;
            style = 48;
            size = 0;
            sizeEx = 1;
            text = QUOTE(PATHTOF(reticles\hamr-reticle65_ca.paa));
            colorText[] = {1,1,1,0};
            colorBackground[] = {0,0,0,0};
            x = safezoneX+0.5*safezoneW-0.5*SIZEX;
            y = safezoneY+0.5*safezoneH-0.5*SIZEX*safezoneW/safezoneH;
            w = SIZEX;
            h = SIZEX*safezoneW/safezoneH;
        };

        class ReticleNight: ReticleDay {
            idc = 1713002;
            text = QUOTE(PATHTOF(reticles\hamr-reticle65Illum_ca.paa));
        };

        #define SIZEX 2*0.76/(getResolution select 5)
        class BodyDay: ReticleDay {
            idc = 1713005;
            text = QUOTE(PATHTOF(reticles\hamr-body_ca.paa));
            x = safezoneX+0.5*safezoneW-0.5*SIZEX;
            y = safezoneY+0.5*safezoneH-0.5*SIZEX*safezoneW/safezoneH;
            w = SIZEX;
            h = SIZEX*safezoneW/safezoneH;
        };

        class BodyNight: BodyDay {
            idc = 1713006;
            text = QUOTE(PATHTOF(reticles\hamr-bodyNight_ca.paa));
        };
    };
};

/*

_ctrl = (D displayCtrl 1713006);

_sizeX = 1.54/(getResolution select 5);
_sizeY = _sizeX*safezoneW/safezoneH;

_ctrl ctrlSetPosition [      
    safezoneX+0.5*safezoneW-0.5*_sizeX,
    safezoneY+0.5*safezoneH-0.5*_sizeY,
    _sizeX,      
    _sizeY  
];
_ctrl ctrlCommit 0

*/

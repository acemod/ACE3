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
            text = QPATHTOF(reticles\ace_shortdot_reticle_1.paa);
            w = 0;
            h = 0;
        };
    };

    class ACE_RscWeapon_base: RscWeaponZeroing {
        controls[] = {"CA_Zeroing","CA_FOVMode","ACE_DrawReticleHelper","ReticleDay","ReticleNight","BodyNight","BodyDay", "trippleHeadLeft", "trippleHeadRight"}; // don't change this order

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
            onDraw = QUOTE([ctrlParent (_this select 0)] call DFUNC(onDrawScope2D));
            idc = -1;
            w = 0;
            h = 0;
        };

        #define SIZEX 0.75/(getResolution select 5)
        class ReticleDay: RscText {
            idc = 1713001;
            style = 48;
            size = 0;
            sizeEx = 1;
            text = "";
            colorText[] = {1,1,1,0};
            colorBackground[] = {0,0,0,0};
            x = safezoneX+0.5*safezoneW-0.5*SIZEX;
            y = safezoneY+0.5*safezoneH-0.5*SIZEX*(4/3);
            w = SIZEX;
            h = SIZEX*(4/3);
        };

        class ReticleNight: ReticleDay {
            idc = 1713002;
            text = "";
        };

        #undef SIZEX
        #define SIZEX 2*0.75/(getResolution select 5)
        class BodyDay: ReticleDay {
            idc = 1713005;
            text = "";
            x = safezoneX+0.5*safezoneW-0.5*SIZEX;
            y = safezoneY+0.5*safezoneH-0.5*SIZEX*(4/3);
            w = SIZEX;
            h = SIZEX*(4/3);
        };

        class BodyNight: BodyDay {
            idc = 1713006;
            text = "";
        };

        //These are just black side panels to cover the areas that the optics p3d doesn't cover
        //It will ONLY effect tripple head users as (safezoneX == safeZoneXAbs) for everyone else
        //Reference PR #1156:
        class trippleHeadLeft: RscText {
            idc = 1713010;
            x = "safeZoneXAbs";
            Y = "safezoneY";
            W = "(safezoneX - safeZoneXAbs) * ((getResolution select 4)/(16/3))";
            H = "safeZoneH";
            colorBackground[] = {0,0,0,1};
        };
        class trippleHeadRight: trippleHeadLeft {
            idc = 1713011;
            x = "safeZoneXAbs + safeZoneWAbs - (safezoneX - safeZoneXABS) * ((getResolution select 4)/(16/3))";
             colorBackground[] = {0,0,0,1};
        };
    };

    class ACE_RscWeapon_Hamr: ACE_RscWeapon_base {
        class ReticleDay: ReticleDay {
            text = QPATHTOF(reticles\hamr-reticle65_ca.paa);
        };

        class ReticleNight: ReticleNight {
            text = QPATHTOF(reticles\hamr-reticle65Illum_ca.paa);
        };

        class BodyDay: BodyDay {
            text = QPATHTOF(reticles\hamr-body_ca.paa);
        };

        class BodyNight: BodyNight {
            text = QPATHTOF(reticles\hamr-bodyNight_ca.paa);
        };
    };

    class ACE_RscWeapon_Arco: ACE_RscWeapon_base {
        class ReticleDay: ReticleDay {
            text = QPATHTOF(reticles\arco-reticle65_ca.paa);
        };

        class ReticleNight: ReticleNight {
            text = QPATHTOF(reticles\arco-reticle65Illum_ca.paa);
        };

        class BodyDay: BodyDay {
            text = QPATHTOF(reticles\arco-body_ca.paa);
        };

        class BodyNight: BodyNight {
            text = QPATHTOF(reticles\arco-bodyNight_ca.paa);
        };
    };

    class ACE_RscWeapon_MRCO: ACE_RscWeapon_base {
        class ReticleDay: ReticleDay {
            text = QPATHTOF(reticles\mrco-reticle556_ca.paa);
        };

        class ReticleNight: ReticleNight {
            text = QPATHTOF(reticles\mrco-reticle556Illum_ca.paa);
        };

        class BodyDay: BodyDay {
            text = QPATHTOF(reticles\mrco-body_ca.paa);
        };

        class BodyNight: BodyNight {
            text = QPATHTOF(reticles\mrco-bodyNight_ca.paa);
        };
    };

    class ACE_RscWeapon_SOS: ACE_RscWeapon_base {
        class ReticleDay: ReticleDay {
            text = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
        };

        class ReticleNight: ReticleNight {
            text = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);
        };

        class BodyDay: BodyDay {
            text = QPATHTOF(reticles\sos-body_ca.paa);
        };

        class BodyNight: BodyNight {
            text = QPATHTOF(reticles\sos-bodyNight_ca.paa);
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

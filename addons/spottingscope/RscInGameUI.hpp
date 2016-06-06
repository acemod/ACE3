
class RscOpticsValue;
class RscMapControl;
class RscText;

class RscInGameUI {
    class RscUnitInfo;
    class GVAR(RscUnitInfo): RscUnitInfo {
        controls[] = {"CA_FOVMode","ScriptedReticleHelper","Reticle","Body","trippleHeadLeft","trippleHeadRight"}; // don't change this order

        class CA_FOVMode: RscOpticsValue {  // idea by Taosenai. Apparently this can be used via isNil check to determine wheter the scope or the kolimator is used
            idc = 154;
            style = 2;
            colorText[] = {0,0,0,0};
            x = 0;
            y = 0;
            w = 0;
            h = 0;
        };

        class ScriptedReticleHelper: RscMapControl {
            onDraw = QUOTE(ctrlParent (_this select 0) call FUNC(animateReticle));
            idc = -1;
            w = 0;
            h = 0;
        };

        class Reticle: RscText {
            idc = IDC_RETICLE;
            style = 48;
            size = 0;
            sizeEx = 1;
            text = QPATHTOF(rsc\spotting_scope_reticle_co.paa);
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            x = POS_X;
            y = POS_Y;
            w = POS_W;
            h = POS_H;
        };

        class Body: Reticle {
            idc = IDC_BODY;
            text = QPATHTOF(rsc\spotting_scope_body_co.paa);
            x = POS_X;
            y = POS_Y;
            w = POS_W;
            h = POS_H;
        };

        //These are just black side panels to cover the areas that the optics p3d doesn't cover
        //It will ONLY effect tripple head users as (safezoneX == safeZoneXAbs) for everyone else
        class trippleHeadLeft: RscText {
            idc = IDC_BLACK_LEFT;
            x = "safeZoneXAbs";
            Y = "safezoneY";
            W = "(safezoneX - safeZoneXAbs) * ((getResolution select 4)/(16/3))";
            H = "safeZoneH";
            colorBackground[] = {0,0,0,1};
        };

        class trippleHeadRight: trippleHeadLeft {
            idc = IDC_BLACK_RIGHT;
            x = "safeZoneXAbs + safeZoneWAbs - (safezoneX - safeZoneXABS) * ((getResolution select 4)/(16/3))";
        };   
    };
};

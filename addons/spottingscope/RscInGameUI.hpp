
class RscOpticsValue;
class RscMapControl;
class RscText;
class RscPicture;

class RscInGameUI {
    class RscUnitInfo;
    class GVAR(RscUnitInfo): RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); {((_this select 0) displayCtrl _x) ctrlShow false} forEach [ARR_4(IDC_RETICLE,IDC_BODY,IDC_BLACK_LEFT,IDC_BLACK_RIGHT)]);
        controls[] = {"CA_FOVMode","ScriptedReticleHelper","trippleHeadLeft","trippleHeadRight","Reticle","Body"}; // don't change this order

        class CA_FOVMode: RscOpticsValue {  // idea by Taosenai. Apparently this can be used via isNil check to determine wheter the scope or the kolimator is used
            idc = 154;
            w = 0;
            h = 0;
        };

        class ScriptedReticleHelper: RscMapControl {
            onDraw = QUOTE(ctrlParent (_this select 0) call FUNC(animateReticle));
            idc = -1;
            w = 0;
            h = 0;
        };

        class Reticle: RscPicture {
            idc = IDC_RETICLE;
            text = QPATHTOF(rsc\spotting_scope_reticle_co.paa);
            x = POS_X;
            y = POS_Y;
            w = POS_W;
            h = POS_H;
        };

        class Body: Reticle {
            idc = IDC_BODY;
            text = QPATHTOF(rsc\spotting_scope_body_co.paa);
        };

        //These are just black side panels to cover the areas that the optics p3d doesn't cover
        //It will ONLY effect tripple head users as (safezoneX == safeZoneXAbs) for everyone else
        class trippleHeadLeft: RscText {
            idc = IDC_BLACK_LEFT;
            x = "safeZoneXAbs";
            Y = "safezoneY";
            w = QUOTE(POS_X_BASE(SIZEX) - safeZoneXAbs);
            h = "safeZoneH";
            colorBackground[] = {0,0,0,1};
        };

        class trippleHeadRight: trippleHeadLeft {
            idc = IDC_BLACK_RIGHT;
            x = QUOTE(safeZoneXAbs + safeZoneWAbs - (POS_X_BASE(SIZEX) - safeZoneXABS));
        };   
    };
};

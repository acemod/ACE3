class RscActivePicture;
class RscControlsGroup;
class RscMapControl;
class RscStructuredText;
class RscText;
class RscTree;

class GVAR(overlay) {
    idd = 12249;
    enableSimulation = 1;
    movingEnable = 0;
    onLoad = QUOTE([ARR_2('onLoad',_this)] call FUNC(handleInterface));
    onUnload = QUOTE([ARR_2('onUnload',_this)] call FUNC(handleInterface));
    onKeyDown = QUOTE([ARR_2('onKeyDown',_this)] call FUNC(handleInterface));
    onKeyUp = QUOTE([ARR_2('onKeyUp',_this)] call FUNC(handleInterface));
    class controls {
        class crosshair: RscActivePicture {
            idc = 52;
            x = 0.5 - W_PART(2);
            y = 0.5 - H_PART(2);
            w = W_PART(4);
            h = H_PART(4);
            text = "\A3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa";
            fixedWidth = 0;
            shadow = 0;
        };
        class compassBack: RscText {
            idc = -1;
            x = COMPASS_X;
            y = safeZoneY;
            w = COMPASS_W;
            h = TOOL_H;
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class compass0_90: RscActivePicture {
            idc = 90;
            x = 0.5;
            y = safeZoneY;
            w = COMPASS_W * 0.5;
            h = TOOL_H;
            text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture180_ca.paa";
        };
        class compass90_180: compass0_90 {
            idc = 180;
            x = 0.5 + COMPASS_W * 0.5;
            text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture270_ca.paa";
        };
        class compass180_270: compass0_90 {
            idc = 270;
            x = 0.5 + COMPASS_W;
            text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture0_ca.paa";
        };
        class compass270_0: compass0_90 {
            idc = 360;
            x = 0.5 + COMPASS_W * 1.5;
            text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture90_ca.paa";
        };
        class compassPin: compassBack {
            x = 0.5 - COMPASS_W / 360;
            w = COMPASS_W / 180;
            colorBackground[]={1,0,0,1};
        };
        class compassLeftBlock: compassPin {
            x = safeZoneXAbs;
            w = COMPASS_X - safeZoneXAbs;
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class compassRightBlock: compassLeftBlock {
            x = 0.5 + COMPASS_W * 0.5;
            w = safeZoneWAbs * 0.5 - COMPASS_W * 0.5;
        };
        class compassFrame: compassBack {
            style = 64;
            shadow=2;
            colorText[]={1,1,1,1};
        };
        class nameTool: RscText {
            idc = IDC_NAME;
            x = safeZoneX;
            y = safeZoneY;
            w = TOOL_W * 2;
            h = TOOL_H;
            shadow = 2;
            colorText[]={1,1,1,1};
            colorBackground[] = {0.1,0.1,0.1,1};
            sizeEx = TOOL_H;
        };
        class nameFrame: nameTool {
            idc = -1;
            style = 64;
        };
        class viewTool: nameTool {
            idc = IDC_VIEW;
            x = safeZoneX + TOOL_W * 2 + MARGIN;
            w = TOOL_W;
        };
        class viewFrame: viewTool {
            idc = -1;
            style = 64;
        };
        class clockTool: viewTool {
            idc = IDC_CLOCK;
            x = safeZoneX + TOOL_W * 3 + MARGIN * 2;
        };
        class clockFrame: clockTool {
            idc = -1;
            style = 64;
        };
        class focusTool: viewTool {
            idc = IDC_FOCUS;
            x = safeZoneX + safeZoneW - TOOL_W * 3 - MARGIN * 2;
        };
        class focusFrame: focusTool {
            idc = -1;
            style = 64;
        };
        class fovTool: viewTool {
            idc = IDC_FOV;
            x = safezoneX + safezoneW - TOOL_W * 2 - MARGIN;
        };
        class fovFrame: fovTool {
            idc = -1;
            style = 64;
        };
        class speedTool: viewTool {
            idc = IDC_SPEED;
            x = safeZoneX + safeZoneW - TOOL_W;
        };
        class speedFrame: speedTool {
            idc = -1;
            style = 64;
        };
        class unitTree: RscTree {
            idc = IDC_TREE;
            x = safeZoneX;
            y = safezoneY + TOOL_H;
            w = TOOL_W * 2;
            h = safeZoneH - TOOL_H;
            borderSize = 1;
            colorBorder[] = {1,1,1,1};
            colorBackground[] = {0.1,0.1,0.1,0.8};
            colorSelect[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
                1
            };
            multiselectEnabled = 0;
            maxHistoryDelay = 1;
        };
        class spectatorMap: RscMapControl {
            idc = IDC_MAP;
            x = safeZoneX;
            y = safeZoneY + TOOL_H;
            w = safeZoneW;
            h = safeZoneH;
        };
        class helpBackground: RscText {
            idc = 5000;
            x = 0.5 - W_PART(12);
            y = 0.5 - H_PART(12);
            w = W_PART(24);
            h = H_PART(24);
            colorBackground[] = {0.1,0.1,0.1,1};
        };
        class helpTitle: helpBackground {
            idc = 5001;
            h = H_PART(1);
            colorText[]={1,1,1,1};
            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
                1
            };
            sizeEx = H_PART(1);
            text = CSTRING(HelpTitle);
        };
        class helpColumnLeft: RscStructuredText {
            idc = 5002;
            x = 0.5 - W_PART(12);
            y = 0.5 - H_PART(11);
            w = W_PART(6);
            h = H_PART(23);
            text = "";
            size = H_PART(1);
            colorBackground[] = {0,0,0,0};
        };
        class helpColumnCentreL: helpColumnLeft {
            idc = 5003;
            x = 0.5 - W_PART(6);
        };
        class helpColumnCentreR: helpColumnLeft {
            idc = 5004;
            x = 0.5;
        };
        class helpColumnRight: helpColumnLeft {
            idc = 5005;
            x = 0.5 + W_PART(6);
        };
    };
};

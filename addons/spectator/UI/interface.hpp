class RscButtonMenu;
class RscControlsGroup;
class RscMapControl;
class RscPicture;
class RscStructuredText;
class RscText;
class RscTree;

class GVAR(interface) {
    idd = 12249;
    enableSimulation = 1;
    movingEnable = 0;
    onLoad = QUOTE([ARR_2('onLoad',_this)] call FUNC(handleInterface));
    onUnload = QUOTE([ARR_2('onUnload',_this)] call FUNC(handleInterface));
    onKeyDown = QUOTE([ARR_2('onKeyDown',_this)] call FUNC(handleInterface));
    onKeyUp = QUOTE([ARR_2('onKeyUp',_this)] call FUNC(handleInterface));
    class controlsBackground {
        class mouseHandler: RscControlsGroup {
            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;
            colorBackground[] = {0,0,0,0};
            onMouseButtonDown = QUOTE([ARR_2('onMouseButtonDown',_this)] call FUNC(handleInterface));
            onMouseButtonUp = QUOTE([ARR_2('onMouseButtonUp',_this)] call FUNC(handleInterface));
            onMouseZChanged = QUOTE([ARR_2('onMouseZChanged',_this)] call FUNC(handleInterface));
            onMouseMoving = QUOTE([ARR_2('onMouseMoving',_this)] call FUNC(handleInterface));
        };
    };
    class controls {
        class compass: RscControlsGroup {
            idc = IDC_COMP;
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = TOOL_H;
            class controls {
                class compassBack: RscText {
                    x = COMPASS_X;
                    y = 0;
                    w = COMPASS_W;
                    h = TOOL_H;
                    colorBackground[] = {0.1,0.1,0.1,1};
                };
                class compass0_90: RscPicture {
                    idc = IDC_COMP_0;
                    x = COMPASS_X + COMPASS_W * 0.5;
                    y = 0;
                    w = COMPASS_W * 0.5;
                    h = TOOL_H;
                    text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture180_ca.paa";
                };
                class compass90_180: compass0_90 {
                    idc = IDC_COMP_90;
                    x = COMPASS_X + COMPASS_W;
                    text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture270_ca.paa";
                };
                class compass180_270: compass0_90 {
                    idc = IDC_COMP_180;
                    x = COMPASS_X + COMPASS_W * 1.5;
                    text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture0_ca.paa";
                };
                class compass270_0: compass0_90 {
                    idc = IDC_COMP_270;
                    x = COMPASS_X + COMPASS_W * 2;
                    text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture90_ca.paa";
                };
                class compassPin: compassBack {
                    x = COMPASS_X + COMPASS_W * 0.5 - COMPASS_W / 360;
                    w = COMPASS_W / 180;
                    colorBackground[]={1,0,0,1};
                };
                class compassLeftBlock: compassPin {
                    x = 0;
                    w = (safeZoneW - COMPASS_W) * 0.5;
                    colorBackground[] = {0.1,0.1,0.1,1};
                };
                class compassRightBlock: compassLeftBlock {
                    x = COMPASS_X + COMPASS_W;
                };
                class compassFrame: compassBack {
                    style = 64;
                    shadow=2;
                    colorText[]={1,1,1,1};
                };
            };
        };
        class nameTool: RscText {
            idc = IDC_TOOL_NAME;
            x = safeZoneX;
            y = safeZoneY;
            w = TOOL_W * 2;
            h = TOOL_H;
            shadow = 2;
            colorText[]={1,1,1,1};
            colorBackground[] = {0.1,0.1,0.1,1};
            sizeEx = H_PART(1);
        };
        class nameFrame: nameTool {
            idc = -1;
            style = 64;
        };
        class viewTool: nameTool {
            idc = IDC_TOOL_VIEW;
            x = safeZoneX + TOOL_W * 2 + MARGIN;
            w = TOOL_W;
        };
        class viewFrame: viewTool {
            idc = -1;
            style = 64;
        };
        class clockTool: viewTool {
            idc = IDC_TOOL_CLOCK;
            x = safeZoneX + TOOL_W * 3 + MARGIN * 2;
        };
        class clockFrame: clockTool {
            idc = -1;
            style = 64;
        };
        class focusTool: viewTool {
            idc = IDC_TOOL_FOCUS;
            x = safeZoneX + safeZoneW - TOOL_W * 3 - MARGIN * 2;
        };
        class focusFrame: focusTool {
            idc = -1;
            style = 64;
        };
        class fovTool: viewTool {
            idc = IDC_TOOL_FOV;
            x = safeZoneX + safeZoneW - TOOL_W * 2 - MARGIN;
        };
        class fovFrame: fovTool {
            idc = -1;
            style = 64;
        };
        class speedTool: viewTool {
            idc = IDC_TOOL_SPEED;
            x = safeZoneX + safeZoneW - TOOL_W;
        };
        class speedFrame: speedTool {
            idc = -1;
            style = 64;
        };
        class unitTools: RscControlsGroup {
            idc = IDC_UNIT;
            x = safeZoneX;
            y = safeZoneY + TOOL_H * 2;
            w = TOOL_W * 2;
            h = safeZoneH - TOOL_H * 4;
            class controls {
                class unitTree: RscTree {
                    idc = IDC_UNIT_TREE;
                    x = 0;
                    y = 0;
                    w = TOOL_W * 2;
                    h = safeZoneH - TOOL_H * 5;
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
                    maxHistoryDelay = -1;
                    onTreeDblClick = QUOTE([ARR_2('onTreeDblClick',_this)] call FUNC(handleInterface));
                };
                class unitRefresh: RscButtonMenu {
                    x = 0;
                    y = safeZoneH - TOOL_H * 5;
                    w = TOOL_W * 2;
                    h = TOOL_H;
                    sizeEx = TOOL_H;
                    text = CSTRING(RefreshList);
                    action = QUOTE([allUnits] call FUNC(updateUnits));
                };
            };
        };
        class spectatorMap: RscMapControl {
            idc = IDC_MAP;
            x = safeZoneX;
            y = safeZoneY + TOOL_H;
            w = safeZoneW;
            h = safeZoneH;
        };
        class helpBox: RscControlsGroup {
            idc = IDC_HELP;
            x = 0.5 - W_PART(12);
            y = 0.5 - H_PART(12);
            w = W_PART(24);
            h = H_PART(24);
            class controls {
                class helpBack: RscText {
                    x = 0;
                    y = 0;
                    w = W_PART(24);
                    h = H_PART(24);
                    colorBackground[] = {0.1,0.1,0.1,1};
                };
                class helpTitle: helpBack {
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
                    x = 0;
                    y = H_PART(1);
                    w = W_PART(6);
                    h = H_PART(23);
                    size = H_PART(0.8);
                    colorBackground[] = {0,0,0,0};
                };
                class helpColumnCentreL: helpColumnLeft {
                    idc = 5003;
                    x = 0 + W_PART(6);
                };
                class helpColumnCentreR: helpColumnLeft {
                    idc = 5004;
                    x = 0 + W_PART(12);
                };
                class helpColumnRight: helpColumnLeft {
                    idc = 5005;
                    x = 0 + W_PART(18);
                };
            };
        };
    };
};

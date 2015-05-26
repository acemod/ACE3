#include "functions\script_component.hpp"

class RscControlsGroupNoScrollbars;
class RscText;
class RscStructuredText;

class RscMapControlBFTTooltip : RscControlsGroupNoScrollbars {
    idc = IDC_TOOLTIP;
    x = safezoneW;
    y = safezoneH;
    w = = TT_W;
    h = 3 * TT_H;
    class controls {
        class Title: RscStructuredText
        {
            idc = IDC_TOOLTIP_TITLE;
            x = 0;
            y = 0;
            w = TT_W;
            h = TT_H;
            colorBackground[] = {0.3,0.3,0.3,1};
        };
        class Subtitle: RscStructuredText
        {
            idc = IDC_TOOLTIP_SUBTITLE;
            x = 0;
            y = TT_H;
            w = TT_W;
            h = TT_H;
            colorBackground[] = {0,0,0,1};
        };
        class Information: RscStructuredText
        {
            idc = IDC_TOOLTIP_INFORMATION;
            x = 0;
            y = 2 * TT_H;
            w = TT_W;
            h = TT_H;
            colorBackground[] = {0,0,0,1};
        };
    };
};

class RscMapControlSaluteReportEdit : RscControlsGroupNoScrollbars {
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    class controls {

    };
};

class TestDisplay {
    idd = 123;
    class controls {
        class RscMapControlSaluteReportEdit;
    };
};

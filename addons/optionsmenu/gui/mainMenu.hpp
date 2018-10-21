class RscControlsGroupNoHScrollbars;
class RscHTML;
class RscText;

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
    class controls {
        class InfoMods: RscControlsGroupNoHScrollbars {
            class Controls;
        };

        class InfoNews: InfoMods {
            class Controls: Controls {
                class Background;
                class BackgroundIcon;
                class Icon;
                class News;
                class Notification;
                class Button;
            };
        };

        class ACE_news_apex: InfoNews {
            idc = IDC_MAIN_INFO;
            y = "safezoneY + safezoneH - (3 * 2 + 1) * (pixelH * pixelGrid * 2) - 4 * (4 * pixelH)";

            class Controls: Controls {
                class Background: Background {};
                class BackgroundIcon: BackgroundIcon {};
                class Icon: Icon {
                    text = QPATHTOF(gui\aceMenuIcon_ca.paa);
                };
                class CurrentVersionInfo: RscText {
                    idc = IDC_MAIN_INFO_CURRENT_VERSION_INFO;
                    style = 1;
                    text = "";
                    sizeEx = "(pixelH * pixelGrid * 1.5)";
                    font = "RobotoCondensedLight";
                    shadow = 1;
                    colorBackground[] = {0,0,0,0};
                    x = 0;
                    y = 0;
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    h = "1 * (pixelH * pixelGrid * 2)";
                    onLoad = "(_this select 0) ctrlenable false;";
                };
                class HTTPVersionInfo: RscHTML {
                    idc = IDC_MAIN_INFO_NEWEST_VERSION_INFO;
                    shadow = 0;

                    class H1 {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                        font = "RobotoCondensedLight";
                        fontBold = "RobotoCondensedLight";
                        align = "right";
                    };
                    class H2: H1 {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                    };
                    class P: H1 {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                    };

                    x = 0;
                    y = "1 * (pixelH * pixelGrid * 2)";
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    h = "1 * (pixelH * pixelGrid * 2)";
                    onLoad = "(_this select 0) ctrlenable false;";
                };
                class Button: Button {
                    tooltip = "Download latest and report issues:";
                    url = "https://github.com/acemod/ACE3/releases";
                };
            };
        };
    };
};

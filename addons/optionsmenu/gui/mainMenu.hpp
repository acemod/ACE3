class RscControlsGroupNoHScrollbars;
class RscHTML;
class RscText;

class ctrlStaticPicture;
class ACE_CtrlConfetti: ctrlStaticPicture {
    text = QPATHTOF(gui\confetti_ca.paa);
    w = "32 * pixelW";
    h = "32 * pixelH";
    x = "safeZoneX - 32 * pixelW";
    y = "safeZoneY - 32 * pixelH";
};

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
            y = "safeZoneY + safeZoneH - (3 * 2 + 1) * (pixelH * pixelGrid * 2) - 4 * (4 * pixelH)";

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

        class ACE_ContributorThanks: RscText {
            idc = 13501;
            text = "";
            style = 2;
            shadow = 2;
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            w = "1";
            x = "0";
            h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            y = "safezoneY + (3 + 0.5 * 6) * (pixelH * pixelGrid * 2)";
        };

        class ACE_ContributorName: ACE_ContributorThanks {
            idc = 13502;
            text = "";
            font = "RobotoCondensedBold";
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
            h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
            y = "safezoneY + (3 + 0.5 * 6) * (pixelH * pixelGrid * 2) + (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        };

        class Logo;
        class ACE_AnniversaryLogo: Logo {
            onLoad = QUOTE(call (uiNamespace getVariable QQFUNC(onLoadAnniversaryLogo)));
            text = QPATHTOF(gui\ace10years_ca.paa);
            onButtonClick = QUOTE(call (uiNamespace getVariable QQFUNC(confettiShower)));
            tooltip = "Party Time!";

            w = "2 * 6 * (pixelW * pixelGrid * 2)";
            x = "0.5 - 6 * (pixelW * pixelGrid * 2)";
            h = "1 * 6 * (pixelH * pixelGrid * 2)";
            y = "safezoneY + (3 - 0.5 * 6) * (pixelH * pixelGrid * 2)";
        };

        class ACE_CtrlConfettiPreload: ACE_CtrlConfetti {};
    };
};

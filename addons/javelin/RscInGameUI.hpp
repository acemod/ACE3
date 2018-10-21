class RscOpticsValue;
class RscControlsGroupNoScrollbars;
class RscPicture;
class RscLine;
class RscMapControl;


// Taken from AGM for optics management.

class RscInGameUI {
    class ACE_RscOptics_javelin {
        idd = 300;
        controls[] = { QGVAR(elements_group), "ACE_Targeting", QGVAR(mapHelper) };
        onLoad = QUOTE(with uiNamespace do {ACE_RscOptics_javelin = _this select 0;};);

        class GVAR(mapHelper): RscMapControl {
            onDraw = QUOTE(_this call FUNC(mapHelperDraw););
            x = -10;
            y = -10;
            w = 0;
            h = 0;
        };    
        
        class GVAR(elements_group): RscControlsGroupNoScrollbars {
            x = "safeZoneX";
            y = "safeZoneY";
            w = "safeZoneW";
            h = "safeZoneH";
            idc = 170;
            class Controls {    
                class CA_Distance: RscOpticsValue {
                    idc = 151;
                    sizeEx = "0";
                    colorText[] = {0,0,0,0};
                    x = 0;
                    y = 0;
                    w = 0;
                    h = 0;
                };
                class GVAR(Day_mode_off): RscPicture {
                    idc = 1001;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (0.03/4)*3*safeZoneH    - safeZoneX";
                    y = "safeZoneY+safeZoneH*0.031 - safeZoneY";
                    w = "0.1045752* (((safeZoneW*3)/4)/safeZoneW)/(1/safeZoneH)";
                    h = "safeZoneH*0.1045752";
                    colorText[] = {0.2941,0.2941,0.2941,1};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\day_co.paa";
                };
                class GVAR(Day_mode): GVAR(Day_mode_off) {
                    idc = 160;
                    colorText[] = {0.2941,0.8745,0.2157,1};
                };
                class GVAR(WFOV_mode_off): GVAR(Day_mode_off) {
                    idc = 1004;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (0.307/4)*3*safeZoneH - safeZoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\wfov_co.paa";
                };
                class GVAR(WFOV_mode_group): RscControlsGroupNoScrollbars {
                    x = "safeZoneX";
                    y = "safeZoneY";
                    w = "safeZoneW";
                    h = "safeZoneH";
                    idc = 163;
                    class Controls {
                        class GVAR(WFOV_mode_on): GVAR(WFOV_mode_off) {
                            idc = -1;
                            y = "0.031*SafeZoneH - SafezoneY";
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.307/4)*3*SafezoneH - SafezoneX";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class StadiaL: RscLine {
                            x = "0.4899*safeZoneW - safeZoneX";
                            y = "0.171*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.049*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class StadiaR: RscLine {
                            x = "0.5109*safeZoneW- safeZoneX";
                            y = "0.171*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.049*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketL: RscLine {
                            x = "((safeZoneW -safeZoneH*3/4)/2)+ (0.293/4)*3*safeZoneH - safeZoneX";
                            y = "0.4677*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.0646*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketR: RscLine {
                            x = "((safeZoneW -safeZoneH*3/4)/2)+ (0.70/4)*3*safeZoneH - safeZoneX";
                            y = "0.4677*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.0646*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketT: RscLine {
                            x = "((safeZoneW -safeZoneH*3/4)/2)+ (0.467/4)*3*safeZoneH - safeZoneX";
                            y = "0.3535*safeZoneH - safeZoneY";
                            w = "0.065* (((safeZoneW*3)/4)/safeZoneW)/(1/safeZoneH)";
                            h = 0;
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class BracketB: RscLine {
                            x = "((safeZoneW -safeZoneH*3/4)/2)+ (0.467/4)*3*safeZoneH - safeZoneX";
                            y = "0.6465*safeZoneH - safeZoneY";
                            w = "0.065* (((safeZoneW*3)/4)/safeZoneW)/(1/safeZoneH)";
                            h = 0;
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };

                    };
                };
                class GVAR(NFOV_mode_off): GVAR(Day_mode_off) {
                    idc = 1003;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (0.586/4)*3*safeZoneH - safeZoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\nfov_co.paa";
                };
                class GVAR(NFOV_mode_group): RscControlsGroupNoScrollbars {
                    x = "safeZoneX";
                    y = "safeZoneY";
                    w = "safeZoneW-safeZoneX";
                    h = "safeZoneH-safeZoneY";
                    idc = 162;
                    class Controls {
                        class GVAR(NFOV_mode_on): GVAR(NFOV_mode_off) {
                            idc = -1;
                            x = "((SafezoneW -SafezoneH*3/4)/2)+ (0.586/4)*3*SafezoneH - SafezoneX";
                            y = "0.031*SafeZoneH - SafezoneY";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class StadiaL: RscLine {
                            x = "0.4788*safeZoneW - safeZoneX";
                            y = "0.171*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.049*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class StadiaR: RscLine {
                            x = "0.5212*safeZoneW - safeZoneX";
                            y = "0.171*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.049*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineHL: RscLine {
                            x = "((safeZoneW -safeZoneH*3/4)/2)+ (0.01/4)*3*safeZoneH - safeZoneX";
                            y = "safeZoneH*0.5 - safeZoneY";
                            w = "0.29* (((safeZoneW*3)/4)/safeZoneW)/(1/safeZoneH)";
                            h = "safeZoneH*0.0";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineHR: RscLine {
                            x = "((safeZoneW -safeZoneH*3/4)/2)+ (0.695/4)*3*safeZoneH - safeZoneX";
                            y = "safeZoneH*0.5 - safeZoneY";
                            w = "0.29* (((safeZoneW*3)/4)/safeZoneW)/(1/safeZoneH)";
                            h = "safeZoneH*0.0";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineVT: RscLine {
                            x = "0.5*safeZoneW - safeZoneX";
                            y = "0.171*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.1825*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                        class LineVB: RscLine {
                            x = "0.5*safeZoneW - safeZoneX";
                            y = "0.6465*safeZoneH - safeZoneY";
                            w = 0;
                            h = "0.1895*safeZoneH";
                            colorText[] = {0.2941,0.8745,0.2157,1};
                        };
                    };
                };

                class GVAR(SEEK_off): GVAR(Day_mode_off) {
                    idc = 699000;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (0.863/4)*3*safeZoneH - safeZoneX";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\seek_co.paa";
                };
                class GVAR(SEEK): GVAR(SEEK_off) {
                    idc = 166;
                    colorText[] = {0.2941,0.8745,0.2157,0};
                };
                class GVAR(Missle_off): GVAR(Day_mode_off) {
                    idc = 1032;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (-0.134/4)*3*safeZoneH - safeZoneX";
                    y = "(safeZoneY + 0.208*safeZoneH) - safeZoneY";
                    colorText[] = {0.2941,0.2941,0.2941,1};
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\missle_co.paa";
                };
                class GVAR(Missle): GVAR(Missle_off) {
                    idc = 167;
                    colorText[] = {0.9255,0.5216,0.1216,0};
                };
                class GVAR(CLU_off): GVAR(Missle_off) {
                    idc = 1027;
                    y = "(safeZoneY + 0.436*safeZoneH) - safeZoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\clu_co.paa";
                };
                class GVAR(HangFire_off): GVAR(Missle_off) {
                    idc = 1028;
                    y = "(safeZoneY + 0.669*safeZoneH) - safeZoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\hangfire_co.paa";
                };
                class GVAR(TOP_off): GVAR(Day_mode_off) {
                    idc = 699001;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (1.023/4)*3*safeZoneH - safeZoneX";
                    y = "(safeZoneY + 0.208*safeZoneH) - safeZoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\top_co.paa";
                    colorText[] = {0.2941,0.8745,0.2157,1};
                };
                class GVAR(DIR): GVAR(Day_mode) {
                    idc = 699002;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (1.023/4)*3*safeZoneH - safeZoneX";
                    y = "(safeZoneY + 0.436*safeZoneH)    - safeZoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\dir_co.paa";
                    colorText[] = {0.2941,0.2941,0.2941,1};
                };
                class GVAR(FLTR_mode_off): GVAR(Day_mode_off) {
                    idc = 1002;
                    x = "(safeZoneX+(safeZoneW -safeZoneH*3/4)/2)+ (1.023/4)*3*safeZoneH - safeZoneX";
                    y = "(safeZoneY + 0.669*safeZoneH)    - safeZoneY";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics_titan\fltr_co.paa";
                };
                class GVAR(FLTR_mode): GVAR(FLTR_mode_off) {
                    idc = 161;
                    colorText[] = {0.2941,0.8745,0.2157,1};
                };
            };
        };
        class ACE_Targeting: RscControlsGroupNoScrollbars {
            idc = 6999;
            x = "safeZoneX";
            y = "safeZoneY";
            w = "safeZoneW";
            h = "safeZoneH";
            enabled = 0;         
            show = 0;
            class Controls {
                class ACE_TargetingConstrains: RscControlsGroupNoScrollbars {
                    x = "safeZoneX";
                    y = "safeZoneY";
                    w = "safeZoneW-safeZoneX";
                    h = "safeZoneH-safeZoneY";

                    enabled = 0;
                    class Controls {
                        class Top: RscPicture {
                            idc = 699101;
                            text = "#(argb,8,8,3)color(1,1,1,1)";
                            colorText[] = {0.2941,0.2941,0.2941,1};
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX";
                            y = "0.15*safeZoneH-safeZoneY";
                            w = "(3/4)*safeZoneH";
                            h = "0.21*safeZoneH";
                        };
                        class Bottom: Top {
                            idc = 699102;
                            y = "0.64*safeZoneH-safeZoneY";
                        };
                        class Left: Top {
                            idc = 699103;
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX";
                            y = "0.36*safeZoneH-safeZoneY";
                            w = "0.31*(3/4)*safeZoneH";
                            h = "0.28*safeZoneH";
                        };
                        class Right: Left {
                            idc = 699104;
                            x = "((safeZoneW -(3/4)*safeZoneH)/2)+ 0.69*(3/4)*safeZoneH - safeZoneX";
                        };
                        class OpticsBorders: RscPicture {
                            idc = 699105;
                            text = QPATHTOF(data\javelin_ui_border_ca.paa);
                            colorText[] = {0,0,0,1};
                            x = "((safeZoneW -(3.1/4)*safeZoneH)/2) - safeZoneX";
                            y = "0.15*safeZoneH-safeZoneY";
                            w = "(3.1/4)*safeZoneH";
                            h = "0.7*safeZoneH";
                        };
                    };
                };

                class ACE_TargetingGate: ACE_TargetingConstrains {
                    idc = 699200;
                    class Controls {
                        class TargetingGateTL: ACE_TargetingConstrains {
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX";
                            y = "0.15*safeZoneH - safeZoneY";
                            idc = 699201;
                            class Controls {
                                class LineH: RscLine {
                                    idc = 699210;
                                    x = "0";
                                    y = "0";
                                    w = "0.025*(3/4)*safeZoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    idc = 699211;
                                    w = "0";
                                    h = "0.025*safeZoneH";
                                };
                            };
                        };
                        class TargetingGateTR: TargetingGateTL {
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX + 0.975*(3/4)*safeZoneH";
                            y = "0.15*safeZoneH - safeZoneY";
                            idc = 699202;
                            class Controls {
                                class LineH: RscLine {
                                    idc = 699220;
                                    x = "0";
                                    y = "0";
                                    w = "0.025*(3/4)*safeZoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    idc = 699221;
                                    x = "0.025*(3/4)*safeZoneH";
                                    w = "0";
                                    h = "0.025*safeZoneH";
                                };
                            };
                        };
                        class TargetingGateBL: TargetingGateTL {
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX";
                            y = "0.825*safeZoneH - safeZoneY";
                            idc = 699203;
                            class Controls {
                                class LineH: RscLine {
                                    x = "0";
                                    y = "0.025*safeZoneH";
                                    w = "0.025*(3/4)*safeZoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    y = "0";
                                    w = "0";
                                    h = "0.025*safeZoneH";
                                };
                            };
                        };
                        class TargetingGateBR: TargetingGateBL {
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX + 0.975*(3/4)*safeZoneH";
                            y = "0.825*safeZoneH - safeZoneY";
                            idc = 699204;
                            class Controls {
                                class LineH: RscLine {
                                    x = "0";
                                    y = "0.025*safeZoneH";
                                    w = "0.025*(3/4)*safeZoneH";
                                    h = "0";
                                    colorText[] = {0.8745,0.8745,0.8745,1};
                                };
                                class LineV: LineH {
                                    x = "0.025*(3/4)*safeZoneH";
                                    y = "0";
                                    w = "0";
                                    h = "0.025*safeZoneH";
                                };
                            };
                        };
                    };
                };


                class ACE_TargetingLines: ACE_TargetingConstrains {
                    idc = 699300;
                    class Controls {
                        class LineH: RscLine {
                            idc = 699301;
                            x = "((safeZoneW -(3/4)*safeZoneH)/2) - safeZoneX";
                            y = "0.5*safeZoneH - safeZoneY";
                            w = "(3/4)*safeZoneH";
                            h = "0";
                            colorText[] = {0.8745,0.8745,0.8745,1};
                        };
                        class LineV: RscLine {
                            idc = 699302;
                            x = "0.5*safeZoneW - safeZoneX";
                            y = "0.15*safeZoneH - safeZoneY";
                            w = "0";
                            h = "0.7*safeZoneH";
                            colorText[] = {0.8745,0.8745,0.8745,1};
                        };
                    };
                };
            };
        };
    };
};

// on        colorText[] = {0.2941, 0.8745, 0.2157, 1.0};
// off        colorText[] = {0.2941, 0.2941, 0.2941, 1.0};
// orange    colorText[] = {0.9255, 0.5216, 0.1216, 1.0};

/*
ACE_Titan_elements_group:     170
ACE_Titan_Day_mode_off:     1001
ACE_Titan_Day_mode:         160
ACE_Titan_WFOV_mode_off:     1004
ACE_Titan_WFOV_mode_group: 163
ACE_Titan_NFOV_mode_off:     1003
ACE_Titan_NFOV_mode_group: 162
ACE_Titan_SEEK_off:         1005 //1001
ACE_Titan_SEEK:             166
ACE_Titan_Missle_off:         1032
ACE_Titan_Missle:             167
ACE_Titan_CLU_off:         1027
ACE_Titan_HangFire_off:     1028
ACE_Titan_TOP_off:         1006
ACE_Titan_DIR:             1007
ACE_Titan_FLTR_mode_off:     1002
ACE_Titan_FLTR_mode:         161
 */

class RscWatch;
class RscPicture;

class RscTitles {
    class GVAR(checkPulse) {
        idd = -1;
        enableSimulation = 1;
        onLoad = QUOTE(with uiNamespace do {GVAR(checkPulseDisplay) = _this # 0});
        duration = 60;
        class ControlsBackground {
            class TheVignette: RscPicture {
                idc = 5000;
                x = "safezoneX";
                y = "safezoneY";
                w = "safezoneW";
                h = "safezoneH";
                text = QPATHTOF(ui\checkPulse_ca.paa);
            };};
        class Controls {};
        class Objects {
            class TheWatch: RscWatch {
                idc = 5001;
                model = "\a3\Missions_F_Oldman\Systems\UI\Objects\WatchDummy.p3d";
                position[] = {0,0,0.15};
                inBack = 0;
                scale = 2;
                enableZoom = 0;
            };
        };
    };
};

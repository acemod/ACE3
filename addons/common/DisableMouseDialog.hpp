class ctrlMapEmpty;
class GVAR(DisableMouse_Dialog) {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgDisableMouse)),_this select 0)];);
    objects[] = {};
    class controlsBackground {
        // Transparent map allows setting custom cursor
        class Background: ctrlMapEmpty {
            idc = 101;
            fade = 1;
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
    };
};

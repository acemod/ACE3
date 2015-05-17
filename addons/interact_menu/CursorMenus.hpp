class GVAR(cursorMenu) {
    idd = 91919;
    access = 0;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgCursorMenu)),_this select 0)]; uiNamespace setVariable [ARR_2(QUOTE(QGVAR(cursorMenuOpened)),true)]);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(cursorMenuOpened)),false)]);
};

class GVAR(customArsenalButton_Button): RscButtonArsenal {
    x = QUOTE(safeZoneW + safeZoneX - 10 * GRID_W);
    y = QUOTE(safeZoneY + 88 * GRID_H);
    w = QUOTE(9 * GRID_W);
    h = QUOTE(9 * GRID_H);

    text = QPATHTOF(data\iconCustom.paa);
    tooltip = "";
    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0),_this select 0)] call FUNC(fillRightPanel));
    colorBackground[] = {0,0,0,0.5};
};

class GVAR(customArsenalButton_Background): ctrlStaticBackground {
    x = QUOTE(safeZoneW + safeZoneX - 13 * GRID_W);
    y = QUOTE(safeZoneY + 88 * GRID_H);
    w = QUOTE(12 * GRID_W);
    h = QUOTE(9 * GRID_H);

    colorBackground[] = {0,0,0,1};
    fade = 1;
    enable = 0;
};

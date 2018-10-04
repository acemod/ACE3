class GVAR(timerUI) {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(timerDisplay), _this select 0)]);
    class controlsBackground {
        class Header: RscText {
            idc = -1;
            text = CSTRING(ExplosiveTimer);
            x = 13.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 13 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorBackground[] = GUI_BCG_COLOR;
            moving = 1;
        };
        class Background: RscText {
            idd = -1;
            x = 13.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 6.1 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 13 * GUI_GRID_W;
            h = 6.5 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.8};
        };
    };
    class controls {
        class DigitBackground_1: RscPicture {
            idc = -1;
            text = QPATHTOF(UI\seven_segment_8.paa);
            x = 14 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 6.6 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 4 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            colorText[] = {0.3, 0.3, 0.3, 0.5};
        };
        class DigitBackground_2: DigitBackground_1 {
            x = 16.4 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
        class DigitBackground_3: DigitBackground_1 {
            x = 19.7 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
        class DigitBackground_4: DigitBackground_1 {
            x = 22.1 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
        class DigitSeparator: DigitBackground_1 {
            text = QPATHTOF(UI\seven_segment_separator.paa);
            x = 18.025 * GUI_GRID_W + GUI_GRID_CENTER_X;
            colorText[] = {1, 0.05, 0.05, 1};
        };
        class Digit_1: DigitBackground_1 {
            idc = IDC_TIMER_DIGIT_1;
            text = QPATHTOF(UI\seven_segment_0.paa);
            colorText[] = {1, 0.05, 0.05, 1};
        };
        class Digit_2: Digit_1 {
            idc = IDC_TIMER_DIGIT_2;
            x = 16.4 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
        class Digit_3: Digit_1 {
            idc = IDC_TIMER_DIGIT_3;
            x = 19.7 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
        class Digit_4: Digit_1 {
            idc = IDC_TIMER_DIGIT_4;
            x = 22.1 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
        class Slider: ctrlXSliderH {
            idc = IDC_TIMER_SLIDER;
            x = 14 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 11.1 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 12 * GUI_GRID_W;
            h = GUI_GRID_H;
            color[] = {0.3, 0.3, 0.3, 0.7};
            colorActive[] = {0.3, 0.3, 0.3, 0.7};
            sliderRange[] = {TIMER_VALUE_MIN, TIMER_VALUE_MAX};
            sliderPosition = TIMER_VALUE_DEFAULT;
        };
        class CancelButton: RscButton {
            idc = -1;
            text = CSTRING(Cancel);
            onButtonClick = QUOTE(closeDialog 0);
            x = 13.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 12.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 5 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
        };
        class ConfirmButton: CancelButton {
            idc = IDC_TIMER_CONFIRM;
            text = CSTRING(SetTime);
            onButtonClick = "";
            x = 21.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
    };
};

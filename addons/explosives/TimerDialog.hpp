class GVAR(timerUI) {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(timerDisplay),_this select 0)]);
    class controlsBackground {
        class Header: RscText {
            idc = -1;
            text = CSTRING(ExplosiveTimer);
            x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(13 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorBackground[] = GUI_BCG_COLOR;
            moving = 1;
        };
        class Background: RscText {
            idd = -1;
            x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(6.1 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(13 * GUI_GRID_W);
            h = QUOTE(6.5 * GUI_GRID_H);
            colorBackground[] = {0, 0, 0, 0.8};
        };
    };
    class controls {
        class DigitBackground_1: RscPicture {
            idc = -1;
            text = QPATHTOF(UI\seven_segment_8.paa);
            x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(6.6 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(4 * GUI_GRID_W);
            h = QUOTE(4 * GUI_GRID_H);
            colorText[] = {0.3, 0.3, 0.3, 0.5};
        };
        class DigitBackground_2: DigitBackground_1 {
            x = QUOTE(16.4 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
        class DigitBackground_3: DigitBackground_1 {
            x = QUOTE(19.7 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
        class DigitBackground_4: DigitBackground_1 {
            x = QUOTE(22.1 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
        class DigitSeparator: DigitBackground_1 {
            text = QPATHTOF(UI\seven_segment_separator.paa);
            x = QUOTE(18.025 * GUI_GRID_W + GUI_GRID_CENTER_X);
            colorText[] = {1, 0.05, 0.05, 1};
        };
        class Digit_1: DigitBackground_1 {
            idc = IDC_TIMER_DIGIT_1;
            text = QPATHTOF(UI\seven_segment_0.paa);
            colorText[] = {1, 0.05, 0.05, 1};
        };
        class Digit_2: Digit_1 {
            idc = IDC_TIMER_DIGIT_2;
            x = QUOTE(16.4 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
        class Digit_3: Digit_1 {
            idc = IDC_TIMER_DIGIT_3;
            x = QUOTE(19.7 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
        class Digit_4: Digit_1 {
            idc = IDC_TIMER_DIGIT_4;
            x = QUOTE(22.1 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
        class Slider: ctrlXSliderH {
            idc = IDC_TIMER_SLIDER;
            x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(11.1 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(12 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            color[] = {0.3, 0.3, 0.3, 0.7};
            colorActive[] = {0.3, 0.3, 0.3, 0.7};
            sliderRange[] = {TIMER_VALUE_MIN, TIMER_VALUE_MAX};
            sliderPosition = TIMER_VALUE_DEFAULT;
        };
        class CancelButton: RscButton {
            idc = -1;
            text = ECSTRING(common,Cancel);
            onButtonClick = QUOTE(closeDialog 0);
            x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(12.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(5 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
        };
        class ConfirmButton: CancelButton {
            idc = IDC_TIMER_CONFIRM;
            text = CSTRING(SetTime);
            onButtonClick = "";
            x = QUOTE(21.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
    };
};

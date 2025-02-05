#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define TEXTURE_0 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture0_ca.paa"
#define TEXTURE_1 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture90_ca.paa"
#define TEXTURE_2 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture180_ca.paa"
#define TEXTURE_3 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture270_ca.paa"

#define BACKGROUND_COLOR {0.1,0.1,0.1,0.4}
#define POINTER_COLOR {0.1,0.1,0.1,1}
#define POINTER_WIDTH_FACTOR (1/128)

#define LEFT (0.5 - 8 * GUI_GRID_W)
#define TOP (safeZoneY + 1.6 * GUI_GRID_H)
#define WIDTH (16 * GUI_GRID_W)
#define HEIGHT (0.5 * GUI_GRID_H)

class RscText;
class RscPicture;
class RscControlsGroupNoScrollbars;

class GVAR(CompassControl): RscControlsGroupNoScrollbars {
    #pragma hemtt suppress pw3_padded_arg
    onLoad = QUOTE(\
        params ['_control'];\
        private _display = ctrlParent _control;\
        private _fnc_update = {\
            params ['_display'];\
            private _compassControl = _display getVariable 'GVAR(compassControl)';\
            private _view = AGLToASL positionCameraToWorld [ARR_3(0,0,0)] vectorFromTo AGLToASL positionCameraToWorld [ARR_3(0,0,1)];\
            private _viewHorizontal = vectorNormalized (_view vectorCrossProduct [ARR_3(0,0,1)]);\
            private _dir = acos (_viewHorizontal select 0);\
            if (_viewHorizontal select 1 > 0) then {\
                _dir = 360 - _dir;\
            };\
            _compassControl ctrlSetPosition [ARR_2(-(16 * GUI_GRID_W) * (_dir / 360),0)];\
            _compassControl ctrlCommit 0;\
        };\
        _display displayAddEventHandler [ARR_2('MouseMoving',_fnc_update)];\
        _display displayAddEventHandler [ARR_2('MouseHolding',_fnc_update)];\
    );
    x = QUOTE(LEFT);
    y = QUOTE(TOP);
    w = QUOTE(WIDTH);
    h = QUOTE(HEIGHT);

    class controls {
        class Background: RscText {
            colorBackground[] = BACKGROUND_COLOR;
            x = 0;
            y = 0;
            w = QUOTE(WIDTH);
            h = QUOTE(HEIGHT);
        };
        class Pointer: RscText {
            colorBackground[] = POINTER_COLOR;
            x = QUOTE(WIDTH/2 - WIDTH*POINTER_WIDTH_FACTOR/2);
            y = 0;
            w = QUOTE(WIDTH*POINTER_WIDTH_FACTOR);
            h = QUOTE(HEIGHT);
        };
        class CompassGroup: RscControlsGroupNoScrollbars {
            #pragma hemtt suppress pw3_padded_arg
            onLoad = QUOTE(\
                params ['_control'];\
                private _display = ctrlParent _control;\
                _display setVariable [ARR_2('GVAR(compassControl)',_control)];\
            );
            x = 0;
            y = 0;
            w = QUOTE(2*WIDTH);
            h = QUOTE(2*HEIGHT);

            class controls {
                class Compass0: RscPicture {
                    text = TEXTURE_0;
                    x = QUOTE(0 * (WIDTH / 4));
                    y = 0;
                    w = QUOTE(WIDTH/4);
                    h = QUOTE(HEIGHT);
                };
                class Compass1: Compass0 {
                    text = TEXTURE_1;
                    x = QUOTE(1 * (WIDTH / 4));
                };
                class Compass2: Compass0 {
                    text = TEXTURE_2;
                    x = QUOTE(2 * (WIDTH / 4));
                };
                class Compass3: Compass0 {
                    text = TEXTURE_3;
                    x = QUOTE(3 * (WIDTH / 4));
                };
                class Compass4: Compass0 {
                    text = TEXTURE_0;
                    x = QUOTE(4 * (WIDTH / 4));
                };
                class Compass5: Compass0 {
                    text = TEXTURE_1;
                    x = QUOTE(5 * (WIDTH / 4));
                };
                class Compass6: Compass0 {
                    text = TEXTURE_2;
                    x = QUOTE(6 * (WIDTH / 4));
                };
                class Compass7: Compass0 {
                    text = TEXTURE_3;
                    x = QUOTE(7 * (WIDTH / 4));
                };
            };
        };
    };
};

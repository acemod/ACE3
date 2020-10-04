class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class NonStrategic;
    class ACE_MarkingLaser: NonStrategic {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };

        scope = 1;
        displayName = "";
        model = QPATHTOF(data\laser.p3d);
        hiddenSelections[] = {"camo"};
        featureType = 2;

        class AnimationSources {
            class AdjustLength {
                source = "user";
                animPeriod = 0;
                initPhase = -10000;
                minValue = -10000;
                maxValue = 0;
            };
        };

        class Reflectors {
            class LightStart {
                position = "start";
                direction = "end";
                selection = "start";
                innerAngle = 1;
                outerAngle = 135;
                coneFadeCoef = 1;

                hitpoint = "";
                size = 1;
                color[] = {1, 1, 1};
                ambient[] = {0.1, 0.1, 0.1};
                dayLight = 0;
                useFlare = 1;
                flareSize = 5;
                flareMaxDistance = 10000;
                intensity = 1000;

                class Attenuation {
                    constant = 0;
                    linear = 0;
                    quadratic = 1;
                    start = 0;
                    hardLimitStart = 100;
                    hardLimitEnd = 100;
                };
            };

            class LightEnd: LightStart {
                position = "light_end";
                direction = "start";
                selection = "end";
                innerAngle = 360;
                outerAngle = 360;

                color[] = {1, 1, 1};
                ambient[] = {1, 1, 1};
                useFlare = 1;
                flareSize = 5;
                flareMaxDistance = 100;
                intensity = 1000;
            };
        };
    };

    class AllVehicles;
    class Air: AllVehicles {
        class Attributes {
            class GVAR(enabled) {
                displayName = CSTRING(Attribute_Enabled_DisplayName);
                tooltip = CSTRING(Attribute_Enabled_Tooltip);
                property = QGVAR(enabled);
                control = "Checkbox";
                typeName = "BOOL";
                expression = QUOTE(_this setVariable [ARR_3('GVAR(enabled)',_value,true)]);
                defaultValue = "(true)";
                condition = "objectVehicle";
            };
        };
    };
};

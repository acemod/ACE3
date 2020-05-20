class CBA_Extended_EventHandlers;

class CfgVehicles {
    class FloatingStructure_F;
    class ACE_MarkingLaser: FloatingStructure_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        scope = 2;
        displayName = "";
        model = QPATHTOF(data\laser.p3d);
        hiddenSelections[] = {"camo"};

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
            class LightEnd {
                position = "light_end";
                direction = "end";
                selection = "end";
                hitpoint = "";
                innerAngle = 360;
                outerAngle = 360;
                coneFadeCoef = 1;
                ambient[] = {1, 1, 1};
                color[] = {1, 1, 1};
                dayLight = 0;
                useFlare = 0;
                size = 1;
                intensity = 1000;
                class Attenuation {
                    start = 0.1;
                    constant = 0;
                    linear = 1000;
                    quadratic = 10;
                    hardLimitStart = 10;
                    hardLimitEnd = 15;
                };
            };

            class LightStart: LightEnd {
                position = "start";
                direction = "end";
                selection = "start";
                innerAngle = 1;
                outerAngle = 135;
                ambient[] = {0.1, 0.1, 0.1};
                useFlare = 1;
                flareSize = 1.5;
                flareMaxDistance = 10000;
                class Attenuation: Attenuation {
                    start = 0;
                    constant = 2;
                    linear = 10;
                    quadratic = 20;
                    hardLimitStart = 5;
                    hardLimitEnd = 6;
                };
            };
        };
    };
};

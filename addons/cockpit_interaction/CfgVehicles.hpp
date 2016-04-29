class CfgVehicles {
    class Helicopter_Base_H;
    class Heli_Light_01_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;

        class ACE_SelfSpatialActions {
            class GVAR(StarterOn) {
                icon = QUOTE(PATHTOF(UI\StarterOff.paa));
                displayName = "";
                selection = "";
                position = "[0.057,1.725,-0.24]";
                distance = 1.5;
                condition = QUOTE(!(_target getVariable [ARR_2(QUOTE(QGVAR(starterOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchStarter));
            };
            class GVAR(StarterOff) {
                icon = QUOTE(PATHTOF(UI\StarterOn.paa));
                displayName = "";
                selection = "";
                position = "[0.057,1.725,-0.24]";
                distance = 1.5;
                condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(starterOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchStarter));
            };
            class GVAR(BatteryOn) {
                icon = QUOTE(PATHTOF(UI\BatteryOff.paa));
                displayName = "";
                selection = "";
                position = "[-0.08,1.74,-0.01]";
                distance = 1.5;
                condition = QUOTE(!(_target getVariable [ARR_2(QUOTE(QGVAR(batteryOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchBattery));
            };
            class GVAR(BatteryOff) {
                icon = QUOTE(PATHTOF(UI\BatteryOn.paa));
                displayName = "";
                selection = "";
                position = "[-0.08,1.74,-0.01]";
                distance = 1.5;
                condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(batteryOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchBattery));
            };
            class GVAR(GeneratorOn) {
                icon = QUOTE(PATHTOF(UI\GeneratorOff.paa));
                displayName = "";
                selection = "";
                position = "[-0.08,1.735,-0.05]";
                distance = 1.5;
                condition = QUOTE(!(_target getVariable [ARR_2(QUOTE(QGVAR(generatorOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchGenerator));
            };
            class GVAR(GeneratorOff) {
                icon = QUOTE(PATHTOF(UI\GeneratorOn.paa));
                displayName = "";
                selection = "";
                position = "[-0.08,1.735,-0.05]";
                distance = 1.5;
                condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(generatorOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchGenerator));
            };
            class GVAR(FuelPumpsOn) {
                icon = QUOTE(PATHTOF(UI\FuelPumpsOff.paa));
                displayName = "";
                selection = "";
                position = "[-0.055,1.74,-0.015]";
                distance = 1.5;
                condition = QUOTE(!(_target getVariable [ARR_2(QUOTE(QGVAR(fuelPumpsOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchFuelPumps));
            };
            class GVAR(FuelPumpsOff) {
                icon = QUOTE(PATHTOF(UI\FuelPumpsOn.paa));
                displayName = "";
                selection = "";
                position = "[-0.055,1.74,-0.015]";
                distance = 1.5;
                condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(fuelPumpsOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchFuelPumps));
            };
            class GVAR(CollisionLightsOn) {
                icon = QUOTE(PATHTOF(UI\CollisionLightsOff.paa));
                displayName = "";
                selection = "";
                position = "[-0.008,1.74,-0.015]";
                distance = 1.5;
                condition = QUOTE(!(_target getVariable [ARR_2(QUOTE(QGVAR(collisionLightsOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchCollisionLight));
            };
            class GVAR(CollisionLightsOff) {
                icon = QUOTE(PATHTOF(UI\CollisionLightsOn.paa));
                displayName = "";
                selection = "";
                position = "[-0.008,1.74,-0.015]";
                distance = 1.5;
                condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(collisionLightsOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchCollisionLight));
            };
            class GVAR(MainLightsOn) {
                icon = QUOTE(PATHTOF(UI\MainLightsOff.paa));
                displayName = "";
                selection = "";
                position = "[0.054,1.735,-0.05]";
                distance = 1.5;
                condition = QUOTE(!(_target getVariable [ARR_2(QUOTE(QGVAR(mainLightsOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchMainLight));
            };
            class GVAR(MainLightsOff) {
                icon = QUOTE(PATHTOF(UI\MainLightsOn.paa));
                displayName = "";
                selection = "";
                position = "[0.054,1.735,-0.05]";
                distance = 1.5;
                condition = QUOTE((_target getVariable [ARR_2(QUOTE(QGVAR(mainLightsOn)),false)]));
                statement = QUOTE([_target] call FUNC(switchMainLight));
            };
        };
    };
};

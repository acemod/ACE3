class CfgSounds {
    class GVAR(nozzle_stop) {
        name = QGVAR(nozzle_stop);
        sound[] = {QPATHTOF(sounds\nozzle_stop.ogg), 1, 1, 50};
        titles[] = {};
    };
    class GVAR(nozzle_start) {
        name = QGVAR(nozzle_start);
        sound[] = {QPATHTOF(sounds\nozzle_start.ogg), 0.8, 1, 50};
        titles[] = {};
    };
};

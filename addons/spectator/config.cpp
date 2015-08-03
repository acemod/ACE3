#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"F3 Project","Head","SilentSpike","voiper"};
        authorUrl = "https://github.com/acemod";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "ui\interface.hpp"

class CfgRespawnTemplates {
    class None {
        onPlayerKilled = QFUNC(bi_respawnNone);
    };
    class Spectator {
        onPlayerKilled = QFUNC(bi_respawnSpectator);
        onPlayerRespawn = QFUNC(bi_respawnSpectator);
    };
    class Instant {
        onPlayerKilled = QFUNC(bi_respawnInstant);
        onPlayerRespawn = QFUNC(bi_respawnInstant);
    };
    class Base {
        onPlayerKilled = QFUNC(bi_respawnBase);
        onPlayerRespawn = QFUNC(bi_respawnBase);
    };
    class EndMission
    {
        onPlayerKilled = QFUNC(bi_respawnEndMission);
        onPlayerRespawn = QFUNC(bi_respawnEndMission);
    };
    class Seagull {
        onPlayerRespawn = QFUNC(bi_respawnSeagull);
    };
    class Wave
    {
        onPlayerKilled = QFUNC(bi_respawnWave);
        onPlayerRespawn = QFUNC(bi_respawnWave);
    };
    class Counter {
        onPlayerKilled = QFUNC(bi_respawnCounter);
        onPlayerRespawn = QFUNC(bi_respawnCounter);
    };
};

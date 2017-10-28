#pragma once
#include "intercept.hpp"
#include <vector>
#include <chrono>

using namespace intercept;
using namespace intercept::types;

class bulletTracker {
public:

    void init();
    void handleFired(game_value args);
    void missionEnded();
    void trackBullet(object projectile, float airFriction);
    void unTrackBullet(object projectile);
    void setPFHEnabled(bool enabled);
    void updateTrajectoryPFH();
private:
    game_value trackedBulletsVar;
    std::vector<std::pair<object, float>> trackedBullets;
    bool ehEnabled = false;
    game_value ehHandle;
    std::chrono::system_clock::time_point lastTrajectoryUpdate;
    client::EHIdentifierHandle updateTrajectoryPFHCallback;
    std::string updateTrajectoryPFHCallbackScript;
};


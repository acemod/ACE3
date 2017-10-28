#include "bulletTracker.hpp"


void bulletTracker::init() {
    std::tie(updateTrajectoryPFHCallbackScript, updateTrajectoryPFHCallback) = client::generate_custom_callback([this](game_value args) -> game_value {
        updateTrajectoryPFH();
        return {};
    });
}

void bulletTracker::handleFired(game_value args) {
    //https://github.com/acemod/ACE3/blob/ffaa195fe576625f052eeee04b1af9f3f377434f/addons/common/functions/fnc_firedEH.sqf#L26
    //args == ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"]
    object _unit = args[0];
    r_string _ammo = args[4];
    object _projectile = args[6];

    bool ABEnabled = sqf::get_variable(sqf::mission_namespace(), "ace_advanced_ballistics_enabled", false);

    //Don't simulate if a Man fires a Bullet with AB enabled.
    bool isBulletBase = sqf::is_kind_of(_projectile, "BulletBase"sv);
    if (ABEnabled && isBulletBase && sqf::is_kind_of(_unit, "Man")) return;

    if (!isBulletBase || sqf::is_kind_of(_projectile, "GrenadeBase"sv)) return;

    if (sqf::distance(_unit, static_cast<object>(sqf::get_variable(sqf::mission_namespace(), "ACE_player"))) >
        static_cast<float>(sqf::get_variable(sqf::mission_namespace(), "ace_winddeflection_simulationRadius"))) return;

    if (trackedBulletsVar.is_nil()) {//We can save a handful of valueable nanoseconds here by only checking this once somehow.
        //grab the array here so we can later modify it by ref.
        trackedBulletsVar = sqf::get_variable(sqf::mission_namespace(), "ace_winddeflection_trackedBullets");
    }

    trackBullet(std::move(_projectile), sqf::get_number(sqf::config_entry() >> "CfgAmmo"sv >> _ammo >> "airFriction"sv));
}

void bulletTracker::missionEnded() {
    trackedBulletsVar.to_array().clear();
    ehHandle = game_value{};
    ehEnabled = false;
}

void bulletTracker::trackBullet(object projectile, float airFriction) {
    trackedBulletsVar.to_array().push_back({ projectile,airFriction });
    trackedBullets.push_back({ projectile,airFriction });
    setPFHEnabled(true);
}

void bulletTracker::unTrackBullet(object projectile) {
    auto& bulletsVar = trackedBulletsVar.to_array();

    bulletsVar.erase(std::remove_if(bulletsVar.begin(), bulletsVar.end(), [&projectile](const auto& val) {
        return val.is_nil() || val.to_array()[0].is_null() || (val.to_array()[0] == projectile);
    }), bulletsVar.end());
    trackedBullets.erase(std::remove_if(trackedBullets.begin(), trackedBullets.end(), [&projectile](const auto& val) {
        return val.first.is_null() || (val.first == projectile);
    }), trackedBullets.end());
    if (trackedBullets.empty()) setPFHEnabled(false);
}

void bulletTracker::setPFHEnabled(bool enabled) {
    if (ehEnabled == enabled) return;
    if (enabled) {
        auto CBA_addEH = sqf::get_variable(sqf::mission_namespace(), "CBA_fnc_addPerFrameHandler");
        auto simulInterval = sqf::get_variable(sqf::mission_namespace(), "ace_winddeflection_simulationInterval");
        //#TODO compile once?

         /* can be used for profiling
            "if (count ace_winddeflection_trackedBullets == 200) then{ _start = diag_tickTime; "
            + updateTrajectoryPFHCallbackScript +
            " ; diag_log(diag_tickTime - _start);} else {"
            + updateTrajectoryPFHCallbackScript +
            " ;};"
          */

        ehHandle = sqf::call(CBA_addEH, { sqf::compile(updateTrajectoryPFHCallbackScript), simulInterval });
        lastTrajectoryUpdate = std::chrono::system_clock::now();
    } else {
        auto CBA_remEH = sqf::get_variable(sqf::mission_namespace(), "CBA_fnc_removePerFrameHandler");
        sqf::call(CBA_remEH, ehHandle);
    }
    ehEnabled = enabled;
}

void bulletTracker::updateTrajectoryPFH() {
    std::vector<object> to_remove;
    vector3 ACE_wind = sqf::get_variable(sqf::mission_namespace(), "ACE_wind");
    auto _isWind = !ACE_wind.zero_distance();

    auto deltaT = std::chrono::duration<double>(std::chrono::system_clock::now() - lastTrajectoryUpdate).count();
    lastTrajectoryUpdate = std::chrono::system_clock::now();

    //This is the reason why we keep 2 arrays of trackedBullets. Can't get values out of game_value this easily
    for (auto&[bullet, airFriction] : trackedBullets) {
        auto velocity = sqf::velocity(bullet);
        auto speedSqr = velocity.magnitude_squared();
        //#TODO store isKindOf inside trackedBullets list
        if (!sqf::alive(bullet) || sqf::is_kind_of(bullet, "BulletBase") && speedSqr < 10000) {
            to_remove.push_back(bullet);
            continue;
        }
        if (!_isWind) continue;

        auto trueVelocity = velocity - ACE_wind;
        auto trueSpeed = trueVelocity.magnitude();
        double dragRef = deltaT * airFriction * speedSqr;
        auto accelRef = velocity.normalize()*dragRef;
        auto newVelocity = velocity - accelRef;


        float drag = deltaT * airFriction * trueSpeed;
        auto accel = trueVelocity*drag;
        newVelocity += accel;

        sqf::set_velocity(bullet, newVelocity);
    }

    for (auto& rem : to_remove) {
        unTrackBullet(rem);
    }

}

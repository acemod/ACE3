#include "shot_tracker.hpp"

#include "client\sqf\sqf.hpp"

namespace intercept {
    namespace example {
        types::vector3 shot::_wind_dir;
        float shot::_delta;
        float shot::_last_time;

        shot::shot()
        {

        }
        shot::shot(types::object & ammo_object_, std::string & type_) : ammo_object(ammo_object_), type(type_)
        {
            sqf::config_entry ammo_reader;
            air_friction = sqf::get_number(ammo_reader >> "CfgAmmo" >> type >> "airFriction");
            if (air_friction > 0.0f) {
                air_friction = std::pow(air_friction, 5.0f);
                air_friction *= -1;
            }
        }
        shot::~shot()
        {
        }
        bool shot::on_frame()
        {
            /*
                _trueVelocity = _bulletVelocity vectorDiff ACE_wind;
                _trueSpeed = vectorMagnitude _trueVelocity;

                _dragRef = _deltaT * _airFriction * _bulletSpeed * _bulletSpeed;
                _accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
                _bulletVelocity = _bulletVelocity vectorDiff _accelRef;

                _drag = _deltaT * _airFriction * _trueSpeed;
                _accel = _trueVelocity vectorMultiply (_drag);
                _bulletVelocity = _bulletVelocity vectorAdd _accel;
            */
            vector3 bullet_velocity = sqf::velocity(ammo_object);
            float bullet_speed = bullet_velocity.magnitude();
            if (bullet_speed < 25.0f)
                return false;
            vector3 true_velocity = bullet_velocity - _wind_dir;
            float true_speed = true_velocity.magnitude();

            float drag_ref = _delta * air_friction * bullet_speed * bullet_speed;
            vector3 accel_ref = bullet_velocity.normalize() * drag_ref;
            bullet_velocity = bullet_velocity - accel_ref;

            float drag = _delta * air_friction * true_speed;
            vector3 accel = true_velocity * drag;
            bullet_velocity = bullet_velocity + accel;

            sqf::set_velocity(ammo_object, bullet_velocity);
            return true;
        }
        void shot::on_destroy()
        {
        }

        void shot::on_frame_setup()
        {
            float current_time = sqf::time();
            _delta = current_time - _last_time;
            _last_time = current_time;
            _wind_dir = sqf::wind();
        }

        shot_tracker::shot_tracker()
        {

        }

        shot_tracker::~shot_tracker()
        {

        }

        void shot_tracker::on_frame()
        {
            auto shot = _shots.begin();
            shot::on_frame_setup();
            while (shot != _shots.end()) {
                if (shot->ammo_object.is_null()) {
                    shot->on_destroy();
                    _shots.erase(shot++);
                }
                else {
                    if(!shot->on_frame())
                        _shots.erase(shot++);
                    else
                        shot++;
                }
            }
        }

        void shot_tracker::add_shot(types::object & ammo_object_, std::string & type_)
        {
            _shots.push_back(shot(ammo_object_, type_));
        }
    }
}
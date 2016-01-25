#pragma once
#include <list>
#include "shared\client_types.hpp"
#include "shared\types.hpp"

namespace intercept {
    namespace example {
        class shot {
        public:
            shot();
            shot(types::object &ammo_object_, std::string &type_);
            ~shot();
            bool on_frame();
            void on_destroy();

            static void on_frame_setup();

            
            types::object ammo_object;
            std::string type;
            float air_friction;

        protected:
            static types::vector3 _wind_dir;
            static float _delta;
            static float _last_time;
        };
        class shot_tracker {
        public:
            shot_tracker();
            ~shot_tracker();
            void on_frame();
            void add_shot(types::object &ammo_object_, std::string &type_);
        protected:
            std::list<shot> _shots;
        };
    }
}
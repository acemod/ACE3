#pragma once
#include <list>
#include "shared\client_types.hpp"
#include "shared\types.hpp"

using namespace intercept;

namespace ace {
    namespace nametags {
        enum icon_type
        {
            none,
            name,
            name_rank,
            name_speak,
            speak
        };

        class nametagger {
        public:
            nametagger();
            ~nametagger();
            void on_frame();
        protected:
            float _scale;
            std::string get_name(types::object & unit_, bool _show_effective_on_vehicle);
            void draw_nametag(types::object & unit_, float alpha_, float heightOffset_, icon_type icon_type_, bool is_player_group_);
        };
    }
}
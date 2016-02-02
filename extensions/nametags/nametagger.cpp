#include "nametagger.hpp"
#include <stdlib.h>
#include <algorithm>
#include <sstream>
#include "client\sqf\sqf.hpp"

using namespace intercept;

namespace ace {
    namespace nametags {
        nametagger::nametagger()
        {
            _scale = 0.666;
        }

        nametagger::~nametagger()
        {

        }

        /*!
        @brief Based on ace_nametags_fnc_onDraw3d
        */
        void nametagger::on_frame()
        {
            int scale_index = sqf::get_variable(sqf::mission_namespace(), "ace_nametags_tagSize", game_value(2.0f));
            if (scale_index == 2) {
                _scale = 0.666f;
            } else if (scale_index == 0) {
                _scale = 0.333f;
            } else if (scale_index == 1) {
                _scale = 0.5f;
            } else if (scale_index == 3) {
                _scale = 0.833f;
            } else {
                _scale = 1.0f;
            }

            if (sqf::is_null(sqf::player())) {
                return;
            }

            float max_distance = sqf::get_variable(sqf::mission_namespace(), "ace_nametags_playerNamesViewDistance", game_value(20.0f));
            float player_names_max_alpha(sqf::get_variable(sqf::mission_namespace(), "ace_nametags_playerNamesMaxAlpha", game_value(1.0f)));

            vector3 cam_pos_agl = sqf::position_camera_to_world(vector3(0,0,0));
            vector3 cam_pos_asl = sqf::agl_to_asl(cam_pos_agl);
            vector3 vecy = sqf::agl_to_asl(sqf::position_camera_to_world(vector3(0,0,1))) - cam_pos_asl;

            std::vector<object> units(sqf::near_objects(cam_pos_agl, "CAManBase", max_distance + 5));
            for (auto unit: units) {

                vector3 rel_pos = sqf::eye_pos(unit) - cam_pos_asl;
                float distance = rel_pos.magnitude();
                float proj_dist = rel_pos.distance(vecy * (rel_pos.dot(vecy)));
                float coefficient = std::max(std::min(1.0f - 0.15f * (proj_dist * 5.0f - distance - 3.0f), 1.0f), 0.0f);
                float alpha = std::max(std::min(1.0f - 0.2f * (distance - max_distance), 1.0f), 0.0f) * coefficient * player_names_max_alpha;

                draw_nametag(unit, alpha, distance * 0.026f, name_rank, true);
            }
        }

        /*!
        @brief Returns the name of a unit. Based on ace_common_fnc_getName
        */
        std::string nametagger::get_name(types::object & unit_, bool _show_effective_on_vehicle)
        {
            if (sqf::is_kind_of(unit_, "CAManBase")) {
                return sqf::get_variable(unit_, "ACE_NameRaw", game_value(""));
            } else {
                if (_show_effective_on_vehicle) {
                    return get_name(sqf::effective_commander(unit_), false);
                } else {
                    sqf::config_entry name_reader;
                    return sqf::get_text(name_reader >> "CfgVehicles" >> sqf::type_of(unit_) >> "displayName");
                }
            };
        }

        /*!
        @brief Draw a nametag for a unit. Based on ace_nametags_fnc_drawNameTagIcon
        */
        void nametagger::draw_nametag(types::object & unit_, float alpha_, float heightOffset_, icon_type icon_type_, bool is_player_group_)
        {
            if (icon_type_ == none) {
                return;
            }
            if (sqf::is_object_hidden(unit_)) {
                return;
            }

            float size = 0;
            float alpha = alpha_;
            std::stringstream ss;
            if (icon_type_ == name_speak || icon_type_ == speak) {
                ss << "\\z\\ace\\addons\\nametags\\ui\\soundwave";
                ss << (int)(rand() % 10);
                ss << ".paa";
                size = 1.0f;
                alpha = std::max(alpha, 0.2f) + 0.2f;
            } else if (icon_type_ == name_rank) {
                ss << "\\A3\\Ui_f\\data\\GUI\\Cfg\\Ranks\\";
                ss << sqf::rank(unit_);
                ss << "_gs.paa";
                size = 1.0f;
            }
            std::string icon(ss.str());

            if (alpha <= 0) {
                return;
            }

            std::string unit_name("");
            if (icon_type_ == name || icon_type_ == name_rank || icon_type_ == name_speak) {
                unit_name = get_name(unit_, true);
            };

            //sqf::rv_color color(sqf::__helpers::__convert_to_numbers_vector(sqf::get_variable(sqf::mission_namespace(), "ace_nametags_defaultNametagColor")));
            sqf::rv_color color{ 0.77f, 0.51f, 0.08f, 1.0f };
            if (is_player_group_) {
                std::string team(sqf::assigned_team(unit_));
                if (team.compare("MAIN") == 0) {
                    color.red = 1; color.green = 1; color.blue = 1;
                } else if (team.compare("RED") == 0) {
                    color.red = 1; color.green = 0; color.blue = 0;
                } else if (team.compare("GREEN") == 0) {
                    color.red = 0; color.green = 1; color.blue = 0;
                } else if (team.compare("BLUE") == 0) {
                    color.red = 0; color.green = 0; color.blue = 1;
                } else if (team.compare("YELLOW") == 0) {
                    color.red = 1; color.green = 1; color.blue = 0;
                };
            }
            color.alpha *= alpha;

            vector3 pos(sqf::asl_to_agl(sqf::eye_pos(unit_)));
            pos.z += heightOffset_ + 0.3f;

            sqf::draw_icon_3d(icon, color, pos, size * _scale, size * _scale, 0, unit_name, 2, 0.05f * _scale, "PuristaMedium");
        }
    }
}
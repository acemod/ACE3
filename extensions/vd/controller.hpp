#pragma once

#include "shared.hpp"
#include "singleton.hpp"
#include "penetration.hpp"
#include "arguments.hpp"
#include "dispatch.hpp"

#define BT_NO_SIMD_OPERATOR_OVERLOADS
#include "btBulletCollisionCommon.h"
#include "btBulletDynamicsCommon.h"

#include "debug\penetration_display.hpp"

namespace ace {
    namespace vehicledamage {
        class controller 
            : public singleton<controller>,
            public threaded_dispatcher {
        public:
            controller();
            ~controller();

            bool reset(const arguments &, std::string &);
            bool get_ready(const arguments &, std::string &);

            bool fetch_result(const arguments &, std::string &);

            bool register_vehicle(const arguments &, std::string &);
            bool delete_vehicle(const arguments &, std::string &);

            bool set_animation_state(const arguments &, std::string &);
            bool set_vehicle_state(const arguments &, std::string &);
            bool handle_hit(const arguments & args, std::string &);

            bool get_animations(const arguments &, std::string &);
            bool get_thickness(const arguments &, std::string &);
            bool selection_position(const arguments &, std::string &);
#ifdef _DEBUG
            bool _test_get_draw(const arguments &, std::string &);
            bool _test_raycast(const arguments &, std::string &);
            bool _test_selection(const arguments &, std::string &);
#endif

#if defined(DEVEL) && defined(USE_DIRECTX)
            bool                                                _debug_render(const arguments &, std::string &);
            bool                                                _debug_render_bullet(const arguments &, std::string &);
            std::unique_ptr<debug::penetration_display>         _debug_display;
#endif

            // Bullet physx world
            std::shared_ptr<btDefaultCollisionConfiguration>    bt_collisionConfiguration;
            std::shared_ptr<btCollisionDispatcher>              bt_collisionDispatcher;
            std::shared_ptr<btCollisionWorld>                   bt_world;

            std::unordered_map<uint32_t, ace::vehicledamage::vehicle_p>     vehicles;


        };

    }
}


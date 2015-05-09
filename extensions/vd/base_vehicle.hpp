#pragma once

#include "shared.hpp"
#include "vector.hpp"
#include "simulation/object.hpp"

#include "base_vehicle.hpp"

#define BT_NO_SIMD_OPERATOR_OVERLOADS
#include "btBulletCollisionCommon.h"
#include "btBulletDynamicsCommon.h"
#include "BulletCollision/Gimpact/btGImpactShape.h"

namespace ace {
    namespace vehicledamage {

        enum SELECTION_SEARCH_TYPE {
            AVERAGE_CENTER, POINTS, FACES
        };

        class base_vehicle {
        public:
            base_vehicle(uint32_t, ace::simulation::object_p, ace::vector3<float>);
            ~base_vehicle();

            float surface_raycast(const ace::vector3<float> &, const ace::vector3<float> &, std::vector<ace::vector3<float>> &);
            float thickness(const ace::vector3<float> &, const ace::vector3<float> &);


            std::vector<ace::vector3<float>> selection_position(const uint32_t, const std::string &, const SELECTION_SEARCH_TYPE);
            std::vector<ace::vector3<float>> selection_by_name_vertices(const uint32_t, const std::string &);
            ace::simulation::named_selection_p selection_by_name(const uint32_t, const std::string &);

            void transform(void);

            // Bullet physx objects
            int                                              fire_lod;

            ace::vector3<float>                              direction;
            ace::vector3<float>                              up;

            std::shared_ptr<btTriangleMesh>                  bt_mesh;
            std::shared_ptr<btBvhTriangleMeshShape>          bt_shape;
            std::shared_ptr<btCollisionObject>               bt_object;
            std::shared_ptr<btRigidBody>                     bt_body;

            ace::simulation::object_p        object;
        protected:

        };
    }
}
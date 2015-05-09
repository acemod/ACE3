#include "vehicle.hpp"

#include "penetration.hpp"
#include "penetration/longrod.hpp"

namespace ace {
    namespace vehicledamage {
        bool vehicle::hit(gamehit * hit) {

            penetration::longrod _test(hit, this);

            _test.process();
            const vehicledamage::penetration::penetration_result & result = _test.result();

            std::vector<ace::vector3<float>> collision_points;
            float first_layer_thickness = 0;

            float total_thickness = surface_raycast(hit->impactposition, hit->impactvelocity, collision_points) * 1000;
            
            if (collision_points.size() < 2) {
                return false;
            }
            float initial_thickness = collision_points[0].distance(collision_points[1]) * 1000;

            LOG(DEBUG) << "Longrod: linear_depth=" << _test.result().linear_depth << ", initial_thickness=" << initial_thickness << ", total_thickness=" << total_thickness;

            /*
            for (int x = 0; x < collision_points.size(); x++) {
               for (int y = 0; y < collision_points.size(); y++) {
                    LOG(DEBUG) << "distance: " << x << ", " << y << " : " << collision_points[x].distance(collision_points[y]);
                    LOG(DEBUG) << "distance: " << x << ", " << y << " : " << collision_points[y].distance(collision_points[x]);
                }
            }*/
            return true;
        }
    }
}
#include "controller.hpp"
#include "model_collection.hpp"
#include "simulation/object.hpp"
#include <chrono>

#include "BulletCollision/NarrowPhaseCollision/btRaycastCallback.h"

#ifdef _DEBUG
#define DEBUG_DISPATCH(x, y) { std::string empty; _debug_display->call(x, arguments(y), empty); }
#else
#define DEBUG_DISPATCH(x, y)
#endif

#include "penetration\longrod.hpp"

namespace ace {
    namespace vehicledamage {
        controller::controller() : threaded_dispatcher() {
            btBroadphaseInterface* broadphase = new btDbvtBroadphase();

            // Set up the collision configuration and dispatcher
            bt_collisionConfiguration = std::make_shared<btDefaultCollisionConfiguration>();
            bt_collisionDispatcher = std::make_shared<btCollisionDispatcher>(bt_collisionConfiguration.get());

            // The world.
            bt_world = std::make_shared<btCollisionWorld>(bt_collisionDispatcher.get(), broadphase, bt_collisionConfiguration.get());

            add("reset", std::bind(&ace::vehicledamage::controller::reset, this, std::placeholders::_1, std::placeholders::_2));
            add("ready", std::bind(&ace::vehicledamage::controller::get_ready, this, std::placeholders::_1, std::placeholders::_2));

            // action results
            add("fetch_result", std::bind(&ace::vehicledamage::controller::fetch_result, this, std::placeholders::_1, std::placeholders::_2));

            // Register functions
            add("register_vehicle", std::bind(&ace::vehicledamage::controller::register_vehicle, this, std::placeholders::_1, std::placeholders::_2));
            add("delete_vehicle", std::bind(&ace::vehicledamage::controller::delete_vehicle, this, std::placeholders::_1, std::placeholders::_2));
            
            add("set_vehicle_state", std::bind(&ace::vehicledamage::controller::set_vehicle_state, this, std::placeholders::_1, std::placeholders::_2));
            add("set_animation_state", std::bind(&ace::vehicledamage::controller::set_animation_state, this, std::placeholders::_1, std::placeholders::_2));

            add("hit", std::bind(&ace::vehicledamage::controller::handle_hit, this, std::placeholders::_1, std::placeholders::_2));
            
            // thickness at point helper function for testing
            add("get_thickness", std::bind(&ace::vehicledamage::controller::get_thickness, this, std::placeholders::_1, std::placeholders::_2));

            add("selection_position", std::bind(&ace::vehicledamage::controller::selection_position, this, std::placeholders::_1, std::placeholders::_2));
#ifdef _DEBUG
            add("debug_render", std::bind(&ace::vehicledamage::controller::_debug_render, this, std::placeholders::_1, std::placeholders::_2));
            add("test_raycast", std::bind(&ace::vehicledamage::controller::_test_raycast, this, std::placeholders::_1, std::placeholders::_2));
            add("test_selection", std::bind(&ace::vehicledamage::controller::_test_selection, this, std::placeholders::_1, std::placeholders::_2));
#endif

#if defined(DEVEL) && defined(USE_DIRECTX)
            _debug_display = std::make_unique<ace::vehicledamage::debug::penetration_display>();
            bt_world->setDebugDrawer(dynamic_cast<btIDebugDraw *>(_debug_display.get()));
#endif

            _ready = true;
        }
        controller::~controller() { }

        bool controller::get_ready(const arguments &_args, std::string & result) {
            result = "0";

            if (!ace::model_collection::get().ready()) {
                result = "-1";
            }

            if (!_ready)
                result = "-1";

            return true;
        }

        bool controller::reset(const arguments &_args, std::string & result) {
            vehicles.clear();

            if (!ace::model_collection::get().ready()) {
                ace::model_collection::get().init();
            }

            return true;
        }

        bool controller::fetch_result(const arguments &_args, std::string & result) {
            result = "";
            if (_results.size() > 0) {
                std::lock_guard<std::mutex> _lock(_results_lock);
                dispatch_result res = _results.front();
                if (res.message.size() > 0) {
                    result = res.message;
                }
                _results.pop();
            }

            

            return true;
        }

        bool controller::register_vehicle(const arguments &_args, std::string & result) {
            if (_args.size() < 3)
                return false;

            std::string model_str = _args[0];
            std::transform(model_str.begin(), model_str.end(), model_str.begin(), ::tolower);
            if (model_str[0] == '\\') {
                model_str.erase(model_str.begin());
            }

            if (ace::model_collection::get().load_model(model_str)) {
                std::shared_ptr<ace::simulation::object> _object = std::make_shared<ace::simulation::object>(model_collection::get().models[model_str].model);
                vehicle_p _vehicle = std::make_shared<vehicle>(static_cast<uint32_t>(_args[1]), _object, _args[2]);
                vehicles[static_cast<uint32_t>(_args[1])] = _vehicle;

                // For results on a valid vehicle registration, we return its animation names for that given vehicle
                std::stringstream _animationNames;
                _animationNames << _vehicle->id;
                for (auto & anim : _vehicle->object->animations) {
                    _animationNames << "," << anim->name;
                    _vehicle->animation_state[anim->name] = 0.0f;
                }
                
                this->push_result("setAnimationNames:"+_animationNames.str());

                LOG(INFO) << "vehicle registered: [id=" << _args[1].as_uint32() << ", type=" << _args[0].as_string() << "]";
                DEBUG_DISPATCH("register_vehicle", _args[1].as_string());

                return true;
            }

            return false;
        }
        bool controller::delete_vehicle(const arguments &_args, std::string & result) {
            uint32_t id = _args[0];

            LOG(INFO) << "vehicle deleted: [id=" << id << "]";

            auto iter = vehicles.find(id);
            if(iter != vehicles.end()) {
                vehicles.erase(iter);
            }

            return true;
        }

        bool controller::set_animation_state(const arguments &_args, std::string & results) {
            if (_args.size() < 3)
                return false;

            uint32_t id = _args[0];

            // First value is id, following values are name,value,name,value,name,value
            if (vehicles.find(id) == vehicles.end())
                return false;

            for (int x = 1, y = 1; x <= vehicles[id]->animation_state.size(); x++, y +=2) {
                std::string animation_name = _args[y];
                float state = _args[y + 1];
                vehicles[id]->animation_state[animation_name] = state;
            }

            return false;
        }
        bool controller::get_animations(const arguments &_args, std::string & results) {
            uint32_t id = static_cast<uint32_t>(_args[1]);

            if (vehicles.find(id) == vehicles.end())
                return false;

            // For results on a valid vehicle registration, we return its animation names for that given vehicle
            std::stringstream _animationNames;
            _animationNames << vehicles[id]->id;
            for (auto & anim : vehicles[id]->object->animations) {
                _animationNames << "," << anim->name;
                vehicles[id]->animation_state[anim->name] = 0.0f;
            }

            this->push_result("get_animations:" + _animationNames.str());

            return false;
        }
        bool controller::set_vehicle_state(const arguments &_args, std::string & result) {
            if (_args.size() < 3) return false;

            if (vehicles.find(_args[0]) == vehicles.end())
                return false;

            vehicles[_args[0]]->direction = _args[1];
            vehicles[_args[0]]->up = _args[2];

            vehicles[_args[0]]->transform();

            return true;
        }

        bool controller::handle_hit(const arguments &_args, std::string & result) {
            if (_args.size() < 18) return false;

            auto _vehicle = vehicles.find(_args[0]);
            if (_vehicle == vehicles.end())
                return false;

            gamehit_p _hit = gamehit::create(_args);
            
            _vehicle->second->hit(_hit.get());

            DEBUG_DISPATCH("show_hit", _args.get());
            
            return false;
        }

        bool controller::get_thickness(const arguments &_args, std::string & result) {
            if (_args.size() < 3) return false;

            if (vehicles.find(_args[0]) == vehicles.end())
                return false;

            float thickness = vehicles[_args[0]]->thickness(_args[1], _args[2]);

            char buff[4096];
            snprintf(buff, 4096, "{ [ %d, \"thickness\", %f] }", _args[0], thickness);
            push_result(std::string(buff));
            result = std::string(buff);
        }
        bool controller::selection_position(const arguments &_args, std::string & result) {
            if (_args.size() < 3) return false;

            uint32_t id = _args[0];
            std::string selection_name = _args[1];
            uint32_t lod = _args[2];

            if (vehicles.find(_args[0]) == vehicles.end())
                return false;

            std::vector<ace::vector3<float>> _vertices = vehicles[id]->selection_by_name_vertices(lod, selection_name);

            std::stringstream ss;
            ss << "[";
            for (auto & v : _vertices) {
                ss << " [";
                ss << v.x() << ", " << v.y() << ", " << v.z();
                ss << " ], ";
            }
            ss << "]";
            LOG(TRACE) << "selection result: " << ss.str();
                
            push_result(ss.str());
            result = ss.str();
        }
#if defined(DEVEL) && defined(USE_DIRECTX)
        bool controller::_debug_render(const arguments &_args, std::string & result) {
            _debug_display->render_thread(1024, 768, false);

            return true;
        }
#endif
#ifdef _DEBUG
        bool controller::_test_raycast(const arguments &_args, std::string & result) {
            ace::simulation::object * _object = new ace::simulation::object(model_collection::get().models[0].model);
            std::shared_ptr<ace::simulation::object> _object_ptr(_object);
            ace::vehicledamage::vehicle _vehicle(12345, _object_ptr, ace::vector3<float>(0,0,0));

            btVector3 from(1000.0f, 1000.0f, 1000.0f), to(-1000.0f, -1000.0f, -1000.0f);
           
            btCollisionWorld::AllHitsRayResultCallback allResults(from, to);
            bt_world->rayTest(from, to, allResults);

            LOG(INFO) << "Raycast test conducted";
            std::stringstream ss;
            for (int x = 0; x < allResults.m_hitPointWorld.size(); x++) {
                LOG(INFO) << "pointWorld[" << x << "] = " << allResults.m_hitPointWorld[x].x() << ", " << allResults.m_hitPointWorld[x].y() << ", " << allResults.m_hitPointWorld[x].z();
                ss << " [";
                ss << allResults.m_hitPointWorld[x].x() << ", " << allResults.m_hitPointWorld[x].y() << ", " << allResults.m_hitPointWorld[x].z();
                ss << " ], ";
            }
            for (int x = 0; x < allResults.m_collisionObjects.size(); x++) {
                LOG(INFO) << "collisionObjects[" << x << "] = " << allResults.m_collisionObjects[x]->getUserIndex();
            }
            if (allResults.m_collisionObjects.size() > 1) {
                LOG(INFO) << "Thickness at direction: " << allResults.m_hitPointWorld[0].distance(allResults.m_hitPointWorld[1]);
                
            }
            
            ss << "]";
            LOG(INFO) << "Result: " << ss.str();

            return true;
        }
        bool controller::_test_selection(const arguments &_args, std::string & result) {
            ace::simulation::object * _object = new ace::simulation::object(model_collection::get().models[0].model);
            std::shared_ptr<ace::simulation::object> _object_ptr(_object);
            ace::vehicledamage::vehicle _vehicle(12345, _object_ptr, ace::vector3<float>(0, 0, 0));
            
            std::vector<ace::vector3<float>> _vertices = _vehicle.selection_by_name_vertices(-1, _args[0]);

            std::stringstream ss;
            ss << "[";
            for (auto & v : _vertices) {
                ss << " [";
                ss << v.x() << ", " << v.y() << ", " << v.z();
                ss << " ], ";
            }
            ss << "]";
            LOG(INFO) << "Result: " << ss.str();
            
            return true;
        }
#endif
    }
}


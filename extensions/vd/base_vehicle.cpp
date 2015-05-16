#pragma once

#include "base_vehicle.hpp"
#include "controller.hpp"
#include "btMatrix4x4.hpp"

using namespace ace::simulation;

namespace ace {
    namespace vehicledamage {
        base_vehicle::base_vehicle(uint32_t id, ace::simulation::object_p object_, ace::vector3<float> position_) : id(id), object(object_) {
            bt_mesh = std::make_shared<btTriangleMesh>();
            
            fire_lod = -1;
            // Find the fire LOD
            for (int x = 0; x < object_->lods.size(); x++)  {
                if (object_->lods[x]->type == LOD_TYPE_GEOMETRY_FIRE) {
                    fire_lod = x;
                    break;
                }
            }
            if (fire_lod == -1) // @TODO: fallback on geo LOD
                fire_lod = 0;
			//fire_lod = 0;
            assert(fire_lod != -1);
            
            // Build the mesh from object faces
            // TODO: LOD!?
            // P3d store in x,z,y format
            for (auto & face : object_->lods[fire_lod]->faces) {
                bt_mesh->addTriangle(
                    btVector3(face->vertices[0]->x(), face->vertices[0]->y(), face->vertices[0]->z()),
                    btVector3(face->vertices[1]->x(), face->vertices[1]->y(), face->vertices[1]->z()),
                    btVector3(face->vertices[2]->x(), face->vertices[2]->y(), face->vertices[2]->z())
                );
            }

            bt_shape = std::make_shared<btBvhTriangleMeshShape>(bt_mesh.get(), true, true);

            bt_object = std::make_shared<btCollisionObject>();
            bt_object->setCollisionShape(bt_shape.get());
            
            bt_object->setUserIndex(id);
            bt_object->setUserPointer((void *)this);

            // @TODO: This is moving it in the bullet world for handling multiple collisions, instead our raytests need to ignore ALL but this type. How do we do that?
            // For now this only works for single-object collisions then
            // Set 3d world bullet position based on game position

            controller::get().bt_world->addCollisionObject(bt_object.get());
        }
        base_vehicle::~base_vehicle() {
            controller::get().bt_world->removeCollisionObject(bt_object.get());
        }

        bool base_vehicle::simulate() {
            std::vector<uint32_t> lods; 
            lods.push_back(fire_lod);

            object->animate(animation_state, lods);

            return true;
        }

        void base_vehicle::transform() {
            btTransform transform = bt_object->getWorldTransform();
            
            transform.getBasis().setEulerZYX(direction.x(), direction.y(), direction.z());
            transform.setOrigin(btVector3(up.x(),up.y(),up.z()));

            bt_object->setWorldTransform(transform);

        }

        float base_vehicle::thickness(const ace::vector3<float> & position, const ace::vector3<float> & direction) {
            float result = -1.0f;

            btVector3 bt_from(position.x(), position.y(), position.z());
            btVector3 bt_dir(direction.x(), direction.y(), direction.z());
            btVector3 bt_to(bt_from + (bt_dir * 100));

            btCollisionWorld::AllHitsRayResultCallback allResults(bt_from, bt_to);
            controller::get().bt_world->rayTest(bt_from, bt_to, allResults);

            // get the first and last result on the target object, give results
            assert(allResults.m_hitPointWorld.size() > 2);
            

            if (allResults.m_hitPointWorld.size() == 2) {
                // @TODO: This just gets the thickness of hte first 2 hit surfaces
                result = allResults.m_hitPointWorld[0].distance(allResults.m_hitPointWorld[1]);
            } else {
                // @TODO:
                // We dont support multi-surface hits yet
                
            }

            return result;
        }

        float base_vehicle::surface_raycast(const ace::vector3<float> & position, const ace::vector3<float> & direction, std::vector<ace::vector3<float>> & results) {
            float result = -1.0f;

            btVector3 bt_from(position.x(), position.y(), position.z());
            btVector3 bt_dir(direction.x(), direction.y(), direction.z());
            btVector3 bt_to(bt_from + (bt_dir * 100));

            btCollisionWorld::AllHitsRayResultCallback allResults(bt_from, bt_to);
            controller::get().bt_world->rayTest(bt_from, bt_to, allResults);

            if (allResults.m_hitNormalWorld.size() > 0) {
                for (int x = 0; x < allResults.m_hitNormalWorld.size(); x++) {
                    results.push_back(ace::vector3<float>(allResults.m_hitNormalWorld[x].x(), allResults.m_hitNormalWorld[x].y(), allResults.m_hitNormalWorld[x].z()));
                }
                result = allResults.m_hitNormalWorld[0].distance(allResults.m_hitNormalWorld[allResults.m_hitNormalWorld.size() - 1]);
            }
            

            return result;
        }

        std::vector<ace::vector3<float>> base_vehicle::selection_position(const uint32_t lod, const std::string &name, const SELECTION_SEARCH_TYPE searchType) {
            named_selection_p selection;
            std::vector<ace::vector3<float>> result;

            if ((selection = selection_by_name(lod, name)) == nullptr)
                return result;

            switch (searchType) {
                case SELECTION_SEARCH_TYPE::AVERAGE_CENTER: {
                    ace::vector3<float> average;
                    std::vector<ace::vector3<float>> results;

                    for (auto & a : selection->vertices) {
                        for (auto & b : selection->vertices) {
                            if (a != b) {
                                average = average + ace::vector3<float>::lerp(static_cast<ace::vector3<float>>(*a), static_cast<ace::vector3<float>>(*b), 0.5f);
                            }
                        }
                    }

                    average = average / results.size();
                    result.push_back(average);

                    break;
                }  
            }
            

            return result;
        }
        std::vector<ace::vector3<float>> base_vehicle::selection_by_name_vertices(const uint32_t lod, const std::string &name) {
            std::vector<ace::vector3<float>> result;

            ace::simulation::named_selection_p selection = selection_by_name(lod, name);

            for (auto & vertex : selection->vertices) {
                result.push_back( static_cast<ace::vector3<float>>(*vertex) );
            }

            return result;
        }
        ace::simulation::named_selection_p base_vehicle::selection_by_name(const uint32_t lod, const std::string &name) {
            named_selection_p result;
            
            if (lod != -1) {
                auto iter = object->lods[lod]->selections.find(name);
                if (iter == object->lods[lod]->selections.end()) {
                    return nullptr;
                }
                result = iter->second;
            } else {
                for (auto & lod : object->lods) {
                    auto iter = lod->selections.find(name);
                    if (iter == lod->selections.end()) {
                        continue;
                    } else {
                        result = iter->second;
                    }
                    
                }
            }

            return result;
        }
    }
};
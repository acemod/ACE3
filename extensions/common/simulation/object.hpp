#pragma once

#include "shared.hpp"

#include <string>
#include <vector>
#include <map>

#define GLM_PRECISION_HIGHP_FLOAT

#include "p3d/model.hpp"
#include "glm/glm.hpp"
#include "glm/vec3.hpp"
#include "glm/mat4x4.hpp"


namespace ace {
	namespace simulation {

		class vertex;
		typedef std::shared_ptr<vertex> vertex_p;

		class lod;
		typedef std::shared_ptr<lod> lod_p;

		class object;
		typedef std::shared_ptr<object> object_p;

		typedef std::map<uint32_t, std::pair<glm::mat4, ace::vector3<float>>> animation_transform;

		class vertex_table {
		public:
			vertex_table() {};
			vertex_table(const ace::p3d::vertex_table_p, const ace::p3d::lod_p, const ace::p3d::model_p);
			~vertex_table();
			vertex_p operator[] (const int index) { return vertices[index]; }
			std::vector<vertex_p> vertices;
		private:
			bool animated;
		};

		class face {
		public:
			face() {};
			face(const ace::p3d::face_p, const ace::p3d::lod_p, const ace::p3d::model_p, ace::simulation::lod *);
			~face();
			uint8_t type;
			std::vector<vertex_p> vertices;
		};
		typedef std::shared_ptr<face> face_p;

		class named_selection {
		public:
			named_selection() {};
			named_selection(const ace::p3d::named_selection_p, const ace::p3d::lod_p, const ace::p3d::model_p, ace::simulation::lod *);
			~named_selection();

			std::string name;
			std::vector<face_p> faces;
			std::vector<vertex_p> vertices;

			void animate(const glm::mat4 &, ace::vector3<float>);
		};
		typedef std::shared_ptr<named_selection> named_selection_p;

		class vertex {
		public:
			vertex(vertex_table &, ace::vector3<float>, uint32_t);
			~vertex();

			ace::vector3<float> operator * (const float &v) { return animated_vertex * v; }
			ace::vector3<float> operator / (const float &v) { return animated_vertex / v; }

			ace::vector3<float> operator * (const ace::vector3<float> &v) { return animated_vertex * v; }
			ace::vector3<float> operator / (const ace::vector3<float> &v) { return animated_vertex / v; }
			ace::vector3<float> operator + (const ace::vector3<float> &v) { return animated_vertex + v; }
			ace::vector3<float> operator - (const ace::vector3<float> &v) { return animated_vertex - v; }
			ace::vector3<float> operator - () { return -(animated_vertex); }

			bool operator == (const ace::vector3<float> &r) { return (animated_vertex == r); }
			bool operator >  (const ace::vector3<float> &r) const { throw 1; }
			bool operator <  (const ace::vector3<float> &r) const { throw 1; }
			bool operator <= (const ace::vector3<float> &r) const { throw 1; }
			bool operator >= (const ace::vector3<float> &r) const { throw 1; }

			float x() { return animated_vertex.x(); }
			float y() { return animated_vertex.y(); }
			float z() { return animated_vertex.z(); }
			uint16_t id() { return this->vertex_id; }

            operator ace::vector3<float>() { return animated_vertex;  }

			std::vector<face *> faces;
			std::vector<named_selection *> selections;

			void animate(const glm::mat4 &, ace::vector3<float>, bool);

		private:
			ace::vector3<float> original_vertex;
			ace::vector3<float> animated_vertex;
			vertex_table &table;
			uint16_t vertex_id;
		};
		

		

		class lod {
		public:
			lod() {};
			lod(const ace::p3d::lod_p, const ace::p3d::model_p);
			~lod();
			uint32_t id;
            float   type;
			vertex_table vertices;
			ace::vector3<float> autocenter_pos;
			std::map<std::string, named_selection_p> selections;
			std::vector<face_p> faces;
		};
		
		class animation;
		typedef std::shared_ptr<animation> animation_p;

		class lod_animation_info {
		public:
			lod_animation_info() {};
			lod_animation_info(animation *, lod_p, const ace::p3d::animate_bone_p, const ace::p3d::animation_p, const ace::p3d::model_p);
			~lod_animation_info();
			animation *animation_definition;
			int32_t index;
			lod_p lod;
			ace::vector3<float> axis_direction;
			ace::vector3<float> axis_position;
		};
		typedef std::shared_ptr<lod_animation_info> lod_animation_info_p;

		

		class animation {
		public:
			animation() {};
			animation(object *, const ace::p3d::animation_p, const ace::p3d::model_p);
			~animation();

			uint32_t        type;
			std::string     name;  // "RightDoor"
			std::string     source;     // "rotor"

			float			min_value;
			float			max_value;
			float			min_phase;
			float			max_phase;

			float			offset0;
			float			offset1;

			float			angle0;
			float			angle1;

			float			hide_value;

			ace::vector3<float> direct_axis_pos;
			ace::vector3<float> direct_axis_dir;

			float direct_angle;
			float direct_axis_offset;

			uint32_t        source_address;

			std::vector<float> transforms;
			std::map<uint32_t, lod_animation_info_p> lod_info;

			animation_transform animate(const float, const std::vector<uint32_t> &, animation_transform);

			float get_scale(float);
		};
		

		class bone;
		typedef std::shared_ptr<bone> bone_p;

		class bone {
		public:
			bone(
				const std::string, 
				const std::vector<std::string> &, 
				const std::map<std::string, ace::p3d::bone_p> &, 
				bone *, 
				const ace::p3d::model_p, 
				object *);

			~bone() {};
			std::string name;
			bone *parent;
			std::vector<bone_p> children;
			std::vector<animation_p> animations;
			object *base_object;
			void animate(const std::map<std::string, float> &, const std::vector<uint32_t> &, animation_transform base_transforms);
		};
		

		class object {
		public:
			object();
			object(const ace::p3d::model_p);
			~object();

			std::vector<lod_p> lods;

			std::vector<animation_p> animations;

			void animate(const std::map<std::string, float> &, const std::vector<std::uint32_t> &);

			std::map<std::string, bone_p> all_bones;

			bone_p root_bone;

		};
		
	}
}

#include "object.hpp"
#include "p3d\parser.hpp"


#include "glm\gtc\matrix_transform.hpp"

ace::simulation::vertex::vertex(vertex_table & _table, ace::vector3<float> _vertex, uint32_t _id, bool reversed) : table(_table), vertex_id(_id)
{
    this->original_vertex = _vertex;
    this->animated_vertex = _vertex;
	if(reversed) {
		this->original_vertex.z(this->original_vertex.z()*-1);
		this->animated_vertex.z(this->animated_vertex.z()*-1);
		this->original_vertex.x(this->original_vertex.x()*-1);
		this->animated_vertex.x(this->animated_vertex.x()*-1);
	}
}

ace::simulation::vertex::~vertex()
{
}


ace::simulation::face::face(
    const ace::p3d::face_p p3d_face,
    const ace::p3d::lod_p p3d_lod,
    const ace::p3d::model_p p3d,
    ace::simulation::lod *object_lod)
{
    this->type = p3d_face->type;
	if (type == 3) {
		for (uint16_t vertex_id : p3d_face->vertex_table) {
			this->vertices.push_back(object_lod->vertices[vertex_id]);
			object_lod->vertices[vertex_id]->faces.push_back(this);
		}
	}
	else if(type == 4) {
		this->vertices.push_back(object_lod->vertices[p3d_face->vertex_table[0]]);
		object_lod->vertices[p3d_face->vertex_table[0]]->faces.push_back(this);

		this->vertices.push_back(object_lod->vertices[p3d_face->vertex_table[1]]);
		object_lod->vertices[p3d_face->vertex_table[1]]->faces.push_back(this);

		this->vertices.push_back(object_lod->vertices[p3d_face->vertex_table[2]]);
		object_lod->vertices[p3d_face->vertex_table[2]]->faces.push_back(this);

		this->sub_face = std::make_shared<face>(p3d_face->vertex_table[2], p3d_face->vertex_table[3], p3d_face->vertex_table[0], object_lod);
	}
}

ace::simulation::face::face(uint32_t v1, uint32_t v2, uint32_t v3, ace::simulation::lod *object_lod) {
	this->type = 3;

	this->vertices.push_back(object_lod->vertices[v1]);
	object_lod->vertices[v1]->faces.push_back(this);

	this->vertices.push_back(object_lod->vertices[v2]);
	object_lod->vertices[v2]->faces.push_back(this);

	this->vertices.push_back(object_lod->vertices[v3]);
	object_lod->vertices[v3]->faces.push_back(this);

}

ace::simulation::face::~face()
{
}

void ace::simulation::vertex::animate(const glm::mat4 &matrix)
{
    ace::vector3<float> temp_vector = this->original_vertex;
    glm::vec4 temp_gl_vector = glm::vec4(temp_vector.x(), temp_vector.y(), temp_vector.z(), 1.0f);
    temp_gl_vector = matrix*temp_gl_vector;
    this->animated_vertex = ace::vector3<float>(temp_gl_vector.x, temp_gl_vector.y, temp_gl_vector.z);
}

ace::simulation::named_selection::named_selection(
    const ace::p3d::named_selection_p p3d_selection,
    const ace::p3d::lod_p p3d_lod,
    const ace::p3d::model_p p3d,
    ace::simulation::lod *object_lod)
{
    this->name = p3d_selection->name;
    for (uint16_t vertex_id : p3d_selection->vertex_table.data) {
        this->vertices.push_back(object_lod->vertices[vertex_id]);
        object_lod->vertices[vertex_id]->selections.push_back(this);
    }
    for (uint16_t face_id : p3d_selection->faces.data) {
        this->faces.push_back(object_lod->faces[face_id]);
		if (object_lod->faces[face_id]->type == 4) {
			this->faces.push_back(object_lod->faces[face_id]->sub_face);
		}
    }
}

ace::simulation::named_selection::~named_selection()
{
}

void ace::simulation::named_selection::animate(const glm::mat4 &matrix)
{
    for (auto selection_vertex : this->vertices) {
        selection_vertex->animate(matrix);
    }
}




ace::simulation::vertex_table::vertex_table(const ace::p3d::vertex_table_p p3d_vertex_table, const ace::p3d::lod_p p3d_lod, const ace::p3d::model_p p3d, bool reversed) : animated(false)
{
    this->vertices.resize(p3d_vertex_table->points.size);
	ace::vector3<float> center_off = p3d_lod->autocenter_pos;//p3d->info->cog_offset;//p3d->info->center_of_gravity + p3d->info->offset_2 + p3d->info->cog_offset;
	//center_off.y(center_off.y() * 2);
	//center_off.x(0);
	//center_off.z(0);
	if (reversed) {
		center_off.x(center_off.x()*-1);
		center_off.z(center_off.z()*-1);
	}
    for (uint32_t i = 0; i <= p3d_vertex_table->points.size - 1; ++i) {
        if (p3d->info->autocenter) {
			ace::vector3<float> new_vertex = p3d_vertex_table->points[i]; 
            this->vertices[i] = std::make_shared<vertex>(*this, new_vertex, i, reversed);
        }
        else {
            this->vertices[i] = std::make_shared<vertex>(*this, p3d_vertex_table->points[i], i, reversed);
        }
    }
}

ace::simulation::vertex_table::~vertex_table()
{
}

ace::simulation::lod::lod(const ace::p3d::lod_p p3d_lod, const ace::p3d::model_p p3d, bool reversed)
{
    this->id = p3d_lod->id;
    this->vertices = vertex_table(p3d_lod->vertices, p3d_lod, p3d, reversed);
	this->autocenter_pos = p3d_lod->autocenter_pos;//p3d->info->center_of_gravity + p3d->info->offset_2 + p3d->info->cog_offset;
	//autocenter_pos.y(autocenter_pos.y() * 2);
	//autocenter_pos.x(0);
	//autocenter_pos.z(0);
	if (reversed) {
		this->autocenter_pos.x(this->autocenter_pos.x()*-1);
		this->autocenter_pos.z(this->autocenter_pos.z()*-1);
	}
    for (ace::p3d::face_p p3d_face : p3d_lod->faces) {
        this->faces.push_back(std::make_shared<face>(p3d_face, p3d_lod, p3d, this));
    }

    for (ace::p3d::named_selection_p p3d_selection : p3d_lod->selections) {
        this->selections[p3d_selection->name] = std::make_shared<named_selection>(p3d_selection, p3d_lod, p3d, this);
    }
	std::vector<face_p> new_faces;
	for (auto test_face : this->faces) {
		if (test_face->type == 4) {
			new_faces.push_back(test_face->sub_face);
		}
	}
	for (auto new_face : new_faces) {
		this->faces.push_back(new_face);
	}
}


ace::simulation::lod::~lod()
{
}

ace::simulation::lod_animation_info::lod_animation_info(
    animation *_animation,
    lod_p _lod,
    const ace::p3d::animate_bone_p p3d_animate_bone,
    const ace::p3d::animation_p p3d_animation,
    const ace::p3d::model_p p3d,
	bool reversed) : animation_definition(_animation), lod(_lod)
{
    this->index = p3d_animate_bone->index;
    if (p3d->info->autocenter) {
		ace::vector3<float> center_off = _lod->autocenter_pos;//p3d->info->cog_offset;//p3d->info->center_of_gravity + p3d->info->offset_2 + p3d->info->cog_offset;
		//center_off.y(center_off.y() * 2);
		//center_off.x(0);
		//center_off.z(0);
		if (reversed) {
			center_off.x(center_off.x()*-1);
			center_off.z(center_off.z()*-1);
		}
        this->axis_position = p3d_animate_bone->axis_position;
        this->axis_direction = p3d_animate_bone->axis_direction;
    }
    else {
        this->axis_position = p3d_animate_bone->axis_position;
        this->axis_direction = p3d_animate_bone->axis_direction.normalize();
    }
	if (reversed) {
		this->axis_position.x(this->axis_position.x()*-1);
		this->axis_position.z(this->axis_position.z()*-1);
		this->axis_direction.x(this->axis_direction.x()*-1);
		this->axis_direction.z(this->axis_direction.z()*-1);
	}
}

ace::simulation::lod_animation_info::~lod_animation_info()
{
}

ace::simulation::animation::animation(object *parent_object, const ace::p3d::animation_p p3d_animation, const ace::p3d::model_p p3d, bool reversed)
{
    this->type = p3d_animation->type;
    this->name = p3d_animation->name;
    this->source = p3d_animation->source;

    this->source_address = p3d_animation->source_address;

    this->min_value = p3d_animation->min_value;
    this->max_value = p3d_animation->max_value;

    this->min_phase = p3d_animation->min_phase;
    this->max_phase = p3d_animation->max_phase;

    switch (type) {
        // rotations
    case 0:
    case 1:
    case 2:
    case 3:
        angle0 = p3d_animation->angle0;
        angle1 = p3d_animation->angle1;
        break;
        // translations
    case 4:
    case 5:
    case 6:
    case 7:
        offset0 = p3d_animation->offset0;
        offset1 = p3d_animation->offset1;
        break;
    case 8:
        direct_axis_pos = p3d_animation->direct_axis_pos;
        direct_axis_dir = p3d_animation->direct_axis_dir;
        direct_angle = p3d_animation->direct_angle;
        direct_axis_offset = p3d_animation->direct_axis_offset;
		if (reversed) {
			this->direct_axis_pos.x(this->direct_axis_pos.x()*-1);
			this->direct_axis_pos.z(this->direct_axis_pos.z()*-1);

			this->direct_axis_dir.x(this->direct_axis_dir.x()*-1);
			this->direct_axis_dir.z(this->direct_axis_dir.z()*-1);
		}
        break;
    case 9:
        hide_value = p3d_animation->hide_value;
    default:
        offset0 = 0.0f;
        offset1 = 0.0f;
    }




    for (ace::p3d::animate_bone_p animation_bone : p3d_animation->bones) {
        this->lod_info[animation_bone->lod] = std::make_shared<lod_animation_info>(this, parent_object->lods[animation_bone->lod], animation_bone, p3d_animation, p3d, reversed);
    }

}

ace::simulation::animation::~animation()
{
}

typedef union {
    float f;
    struct {
        uint32_t sh1 : 32;
    } parts;
} double_cast;

#define RAD2DEG(rad)	(rad * 180.0f / 3.1415926f);

typedef std::map<uint32_t, glm::mat4> animation_transform;

animation_transform ace::simulation::animation::animate(const float phase, const std::vector<uint32_t> &lods, animation_transform base_transforms)
{
    animation_transform return_matrices;
    for (auto lod_id : lods) {
        glm::mat4 base_matrix = base_transforms[lod_id];
        glm::mat4 animation_matrix, direction_matrix;
        ace::vector3<float> rotation_offset = ace::vector3<float>(0, 0, 0);

        float scale = get_scale(phase);

        glm::vec3 axis_position = glm::vec3(this->lod_info[lod_id]->axis_position.x(), this->lod_info[lod_id]->axis_position.y(), this->lod_info[lod_id]->axis_position.z());
        glm::vec3 axis_direction = glm::vec3(this->lod_info[lod_id]->axis_direction.x(), this->lod_info[lod_id]->axis_direction.y(), this->lod_info[lod_id]->axis_direction.z());

        switch (this->type) {
            //rotation
        case 0: {
            scale = (scale / (max_value - min_value)) * (angle1 - angle0);
			animation_matrix = glm::translate(glm::mat4(1.0f), axis_position);
			animation_matrix *= glm::rotate(glm::mat4(1.0f), scale, axis_direction);
			animation_matrix *= glm::translate(glm::mat4(1.0f), -axis_position);
            break;
        }
                //rotationX
        case 1: {
            scale = (scale / (max_value - min_value)) * (angle1 - angle0);

            glm::vec3 rotation_axis = glm::vec3(1.0f, 0.0f, 0.0f);

			animation_matrix = glm::translate(glm::mat4(1.0f), axis_position);
            animation_matrix *= glm::rotate(glm::mat4(1.0f), -scale, rotation_axis);
			animation_matrix *= glm::translate(glm::mat4(1.0f), -axis_position);
            break;
        }
                //rotationY
        case 2: {
            scale = (scale / (max_value - min_value)) * (angle1 - angle0);
            glm::vec3 rotation_axis = glm::vec3(0.0f, 1.0f, 0.0f);
			
			animation_matrix = glm::translate(glm::mat4(1.0f), axis_position);
			animation_matrix *= glm::rotate(glm::mat4(1.0f), -scale, rotation_axis);
			animation_matrix *= glm::translate(glm::mat4(1.0f), -axis_position);
            break;
        }
                //rotationZ
        case 3: {
            scale = (scale / (max_value - min_value)) * (angle1 - angle0);
            glm::vec3 rotation_axis = glm::vec3(0.0f, 0.0f, 1.0f);
			animation_matrix = glm::translate(glm::mat4(1.0f), axis_position);
			animation_matrix *= glm::rotate(glm::mat4(1.0f), -scale, rotation_axis);
			animation_matrix *= glm::translate(glm::mat4(1.0f), -axis_position);
            break;
        }
                //translation
        case 4: {
            scale = (scale / (max_value - min_value)) * (offset1 - offset0);
            glm::vec3 direction(axis_direction);
            direction = direction * scale;
            animation_matrix = glm::translate(glm::mat4(1.0f), direction);

            break;
        }
                //translationX
        case 5: {
            animation_matrix = glm::translate(animation_matrix, glm::vec3(
                scale,
                0.0f,
                0.0f
                ));
            break;
        }
                //translationY
        case 6: {
            animation_matrix = glm::translate(animation_matrix, glm::vec3(
                0.0f,
                scale,
                0.0f
                ));
            break;
        }
                //translationZ
        case 7: {
            animation_matrix = glm::translate(animation_matrix, glm::vec3(
                0.0f,
                0.0f,
                scale
                ));
            break;
        }
        case 8: {
            // fuck direct for now
            break;
        }
                //hide
        case 9: {
            if (scale >= hide_value)
                animation_matrix = glm::mat4x4(0.0f);
            break;
        }
        default: {}
        }
        return_matrices[lod_id] = base_matrix * animation_matrix;
    }
    return return_matrices;
}

float ace::simulation::animation::get_scale(float phase)
{
    float scale = 0;


    switch (source_address)
    {
    case 1:
		scale = fmod(phase - min_value, max_value - min_value) + min_value;
        scale = std::min(std::max(scale, min_phase), max_phase);
        break;
    case 2:
		//@TODO: possibly a better way to do this?!
		if (min_phase < 0.0f && phase < 0) {
			scale = std::fmod((std::fabs(phase) - std::fabs(min_value)), ((max_value - min_value) * 2)) + min_value;
		}
		else {
			scale = std::fmod((phase - min_value), ((max_value - min_value) * 2)) + min_value;
		};
		if (scale>max_value) scale = max_value - (scale - max_value);
        scale = std::min(std::max(scale, min_phase), max_phase);
        break;
    default:
        scale = std::min(std::max(phase, min_phase), max_phase);
    }

    return scale;
}

ace::simulation::bone::bone(
    const std::string _name,
    const std::vector<std::string> &children,
    const std::map<std::string, ace::p3d::bone_p> &p3d_bones,
    bone *_parent,
    const ace::p3d::model_p p3d,
    object * sim_object
    ) : parent(_parent), name(_name), base_object(sim_object)
{
    for (auto const child_bone : children) {
        if (sim_object->all_bones.find(child_bone) == sim_object->all_bones.end()) {
            ace::p3d::bone_p p3d_bone = p3d_bones.find(child_bone)->second;
            sim_object->all_bones[child_bone] = std::make_shared<bone>(p3d_bone->name, p3d_bone->children, p3d_bones, this, p3d, sim_object);
        }
        this->children.push_back(sim_object->all_bones[child_bone]);
    }
    if (parent) {
        for (auto p3d_animation : p3d_bones.find(name)->second->animations) {
            this->animations.push_back(sim_object->animations[p3d_animation]);
        }
    }
}

void ace::simulation::bone::animate(const std::map<std::string, float> &animation_state, const std::vector<uint32_t> &lods, animation_transform base_transforms)
{
    if (animations.size() > 0) {
        for (auto bone_animation : animations) {
            if (animation_state.find(bone_animation->name) != animation_state.end()) {
                base_transforms = bone_animation->animate(animation_state.find(bone_animation->name)->second, lods, base_transforms);
            }
        }
    }
    for (auto child_bone : children) {
        child_bone->animate(animation_state, lods, base_transforms);
    }
    for (auto lod_id : lods) {
        auto selection = this->base_object->lods[lod_id]->selections.find(this->name);
        if (selection != this->base_object->lods[lod_id]->selections.end()) {
            selection->second->animate(base_transforms[lod_id]);
        }
    }
}

ace::simulation::object::object()
{
}

ace::simulation::object::object(const ace::p3d::model_p model, bool reverse_ = false) : reversed(reverse_)
{
    for (ace::p3d::lod_p p3d_lod : model->lods) {
        lod_p new_lod = std::make_shared<lod>(p3d_lod, model, reversed);
        this->lods.push_back(new_lod);
        this->lods[p3d_lod->id]->type = model->info->resolutions[p3d_lod->id];
    }

    for (ace::p3d::animation_p p3d_animation : model->animations) {
        this->animations.push_back(std::make_shared<animation>(this, p3d_animation, model, reversed));
    }

    std::map<std::string, ace::p3d::bone_p> p3d_bones;
    for (auto const skeleton_bone : model->skeleton->all_bones) {
        p3d_bones[skeleton_bone->name] = skeleton_bone;
    }

    std::vector<std::string> root_bones;
    for (auto const root_bone : model->skeleton->root_bones) {
        root_bones.push_back(root_bone.first);
    }

    this->root_bone = std::make_shared<bone>("", root_bones, p3d_bones, nullptr, model, this);
}



ace::simulation::object::~object()
{

}

void ace::simulation::object::animate(const std::map<std::string, float> &animation_state, const std::vector<uint32_t> &selected_lods)
{
    animation_transform identity_transform;
    for (uint32_t lod_id : selected_lods) {
        identity_transform[lod_id] = glm::mat4(1.0);
    }
    this->root_bone->animate(animation_state, selected_lods, identity_transform);
}



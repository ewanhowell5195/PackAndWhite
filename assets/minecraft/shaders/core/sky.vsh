#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>

layout(location = 0) in vec3 Position;

layout(location = 0) out float sphericalVertexDistance;
layout(location = 1) out float cylindricalVertexDistance;
layout(location = 2) out vec3 skyPos;
layout(location = 3) out float discY;

void main() {
    vec3 pos = Position;
    if (pos.y > 0.0 && (pos.x != 0.0 || pos.z != 0.0)) {
        pos.y = -512.0;
    }

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    skyPos = pos;
    discY = Position.y;
}

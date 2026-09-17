#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:greyscale.glsl>

layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;
layout(location = 2) in vec3 skyPos;
layout(location = 3) in float discY;

layout(location = 0) out vec4 fragColor;

void main() {
    float spherical = sphericalVertexDistance;
    float cylindrical = cylindricalVertexDistance;
    if (discY > 0.0) {
        vec3 dir = normalize(skyPos);
        vec3 hit = dir * (discY / max(dir.y, 0.0001));
        spherical = fog_spherical_distance(hit);
        cylindrical = fog_cylindrical_distance(hit);
    }
    fragColor = greyscale(apply_fog(ColorModulator, spherical, cylindrical, 0.0, FogSkyEnd, FogSkyEnd, FogSkyEnd, FogColor));
}

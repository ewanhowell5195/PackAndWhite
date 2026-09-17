#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:greyscale.glsl>

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec3 skyPos;
in float discY;

out vec4 fragColor;

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

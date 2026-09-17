#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:greyscale.glsl>


in float sphericalVertexDistance;
in float cylindricalVertexDistance;
flat in vec4 vertexColor;

out vec4 fragColor;

void main() {
    fragColor = greyscale(apply_fog(vertexColor, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor));
}

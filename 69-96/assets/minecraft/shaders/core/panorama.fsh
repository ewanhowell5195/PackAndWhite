#version 330
#moj_import <minecraft:greyscale.glsl>

uniform samplerCube Sampler0;

in vec3 texCoord0;

out vec4 fragColor;

void main() {
    fragColor = greyscale(texture(Sampler0, texCoord0));
}

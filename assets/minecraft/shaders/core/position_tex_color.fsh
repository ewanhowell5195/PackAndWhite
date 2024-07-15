#version 150

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;

in vec2 texCoord0;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor;
    if (color.a < 0.1) {
        discard;
    }
    color.rgb = vec3(dot(color.rgb, vec3(0.299, 0.587, 0.114)));
    fragColor = color * ColorModulator;
}
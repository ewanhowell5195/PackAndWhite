#version 150

in vec4 vertexColor;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }
    color.rgb = vec3(dot(color.rgb, vec3(0.299, 0.587, 0.114)));
    fragColor = color * ColorModulator;
}
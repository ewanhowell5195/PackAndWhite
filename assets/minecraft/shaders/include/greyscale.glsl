#ifndef GREYSCALE_GLSL
#define GREYSCALE_GLSL

vec4 greyscale(vec4 color) {
    return vec4(vec3(dot(color.rgb, vec3(0.299, 0.587, 0.114))), color.a);
}

#endif

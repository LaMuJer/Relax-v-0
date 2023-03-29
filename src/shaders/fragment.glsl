varying vec2 vUv;
varying vec3 vColor;

void main (){

    // Disc
//    float strength = distance(gl_PointCoord,vec2(0.5));
//    strength = step(0.5,strength);
//    strength = 1.0 - strength;

    // Diffuse Point
//    float strength = distance(gl_PointCoord,vec2(0.5));
//    strength *= 2.0;
//    strength = 1.0 - strength;

    // Light Point
    float strength = distance(gl_PointCoord,vec2(0.5));
    strength = 1.0 - strength;
    strength = pow(strength,10.0);

    // Final Color
    vec3 mixColor = mix(vec3(0.0), vColor, strength);

    gl_FragColor = vec4(mixColor,1.0);
}
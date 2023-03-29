varying vec2 vUv;
varying vec3 vColor;
uniform float uSize;
attribute float aScale;
uniform float uTime;
uniform vec3 aRandomness;

void main(){
    vUv = uv;
    vec4 modelPosition = modelMatrix * vec4(position , 1.0);

    // Animation
    // Angle
    float angle = atan(modelPosition.x,modelPosition.z);
    float distanceToCentre = length(modelPosition.xz);
    float angleOffset = (1.0 / distanceToCentre) * uTime * 0.2;
    angle += angleOffset;
    modelPosition.x = cos(angle) * distanceToCentre;
    modelPosition.z = sin(angle) * distanceToCentre;

    // Randomness
    modelPosition.x += aRandomness.x;
    modelPosition.y += aRandomness.y;
    modelPosition.z += aRandomness.z;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition  ;

    // Size
    gl_PointSize = uSize * aScale;
    gl_PointSize *= ( 1.0 / - viewPosition.z );

    // Color
    vColor = color;


}
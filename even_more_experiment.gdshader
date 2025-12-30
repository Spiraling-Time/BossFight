shader_type canvas_item;
uniform vec3 circles[64];
void vertex() {
	// Called for every vertex the material is visible on.
}
float circle(vec2 i1st, vec2 i2, float s){
    return step(distance(i1st, i2), s);
}
void fragment() {
	vec2 st = UV;
	COLOR = vec4(circle(st, circles[0].xy, circles[0].z), 1.0, 1.0, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

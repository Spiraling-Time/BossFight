shader_type canvas_item;
uniform vec3 circles[1024];
uniform vec3 colors[1024];
void vertex() {
	// Called for every vertex the material is visible on.
}
float circle(vec2 i1st, vec2 i2, float s){
    return step(distance(i1st, i2), s);
}

void fragment() {
	vec2 st = UV;
	float total = 0.0;
	vec3 colorTotal = vec3(0.0, 0.0, 0.0);
	for (int i = 0; i < 1024; i++) {
		float sZe = circles[i].z+circles[i].z*abs(sin(TIME))/2.0;
		float tC = circle(st, circles[i].xy, sZe);
    	total += tC;
		float d = distance(circles[i].xy, st);
		colorTotal += step(d, sZe) *colors[i];
	}
	COLOR = vec4(colorTotal, total);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

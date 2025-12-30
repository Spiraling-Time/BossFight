shader_type canvas_item;
uniform vec2 circles[64];
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(circles[0].x, 1.0, 1.0, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

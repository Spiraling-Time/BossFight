shader_type canvas_item;
void vertex() {
	//VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
}
float circle(vec2 i1, vec2 i2, float s){
    return step(distance(i1, i2), s);
}

void fragment() {
	vec2 st = FRAGCOORD.xy * SCREEN_PIXEL_SIZE;
	float finalcircle = circle(st, vec2(0.5,0.5), 0.05);
	COLOR = vec4(finalcircle,1.0,abs(sin(TIME)), 1.0);
}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
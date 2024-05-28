shader_type canvas_item;


uniform sampler2D noiseTexture:  	repeat_enable;
uniform bool isSoft = false;
uniform float speed : hint_range(0.0, 1.0) = 0.1;
uniform float brightness: hint_range(0.0, 2.0) = 0.1;
uniform float threshold : hint_range(0.0, 2.0) = 0.1;
uniform float fluffiness : hint_range(0.0, 2.0) = 0.1;
uniform vec2 position_offset;


void fragment() {
	// Mixing two time-shifted textures to create fluffiness
	vec4 noise1 = texture(noiseTexture, mod(UV + position_offset + TIME * 2.5 * speed / 10.0, 0.0));
	vec4 noise2 = texture(noiseTexture, mod(UV + position_offset + TIME * (2.5 + fluffiness * 3.0) * speed / 10.0, 0.0));
	vec4 combinedNoise = noise1 + noise2;
	
	if (isSoft == true) {
		// Creating smooth transitions using smoothstep
		combinedNoise.a = combinedNoise.r;
		COLOR.rgb = smoothstep(threshold - 0.3, threshold + 0.3, combinedNoise).rgb * brightness;
		COLOR.a =  smoothstep(threshold - 0.3, threshold + 0.3, combinedNoise).a;
	}
	else {
		// Creating hard transitions
		COLOR.rgb = vec3(0.1,0.0,0.15);
		if (combinedNoise.r < threshold) {
			COLOR.a = 0.0;
		}
		else
		{
			COLOR.a = 0.3;
		}
		if (combinedNoise.r > threshold-0.12 && combinedNoise.r < threshold+0.03) {
			COLOR.a = smoothstep(threshold-0.12, threshold+0.03, combinedNoise).r*0.3;
		}
		
	}
}
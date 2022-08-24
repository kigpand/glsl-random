#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float random(float f);
float random(vec2 f);

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;
    
    // float x좌표에 따라서 랜덤한 숫자를 발생시켜서 대입.
    // vec3 col = vec3(random(coord.x));
    
    // vec2 random은 vec2값이 input되므로 coord 자체를 넣어줘도 상관없음
    vec3 col = vec3(random(coord));
    gl_FragColor = vec4(col, 1.);
}

// https://thebookofshaders.com/10/
float random(float f) {
    // 기본 sin 그래프
    // float y = fract(sin(f) * 1.);
    // f에 숫자를 곱해 프리퀀시에 조밀하게 바꾸고 프리퀀시에 숫자를 곱해 더욱 예측이 불가능한 값이 return
    // 0~1사이의 값이 예측할 수 없게 발생되는 모의 랜덤 함수
    float y = fract(sin(f*712.5522) * 7894.111);
    return y;
}

// return 값은 float data가 return 되어야하므로 2차원 data를 1차원으로 변환해줘야함 => 내적함수 dot 활용
// random 함수에서 사용되는 숫자들은 전부 임의의 큰 수.
float random(vec2 v2) {
    // 입력받은 v2가 두번째 매개변수의 vec2값과의 내적값이 반환(float f = (v2.x * 760.26593) + (v2.y * 9125.6682))
    float f = dot(v2, vec2(760.26593, 9125.6682));
    
    // 규칙성이 있어보이면 임의의 숫자를 조정.
    float y = fract(sin(f*123.2352) * 34634.12412);
	// return random(f);
    return y;
}
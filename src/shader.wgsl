// Vertex shader
struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) color: vec3<f32>,
};

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec3<f32>,
    @location(1) pos: vec3<f32>
};

@vertex
fn vs_main(
    model: VertexInput,
) -> VertexOutput {
    var out: VertexOutput;
    out.color = model.color;
    out.clip_position = vec4<f32>(model.position, 1.0);
    /* out.clip_position = vec4<f32>([sin(model.position[0]), sin(model.position[1]), sin(model.position[2]), 1.0]); */
    /* out.clip_position[0] = exp(model.position[0]); */
    /* out.clip_position[1] = exp(model.position[1]); */
    /* out.clip_position[2] = exp(model.position[2]); */
    out.pos = model.position;
    return out;
}

// Fragment shader
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
  var out: vec4<f32>;
  out[0] = exp(in.pos[0]);
  out[1] = exp(in.pos[1]);
  out[2] = exp(in.pos[0] + in.pos[1]);
  out[3] = 1.0;
  return out;
}

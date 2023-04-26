struct Out {
  @builtin(position) pos: vec4<f32>,
  @location(0) cell: f32,
}

@binding(0) @group(0) var<uniform> size: vec2<u32>;

@vertex
fn main(@builtin(instance_index) instance: u32, @location(0) cell: u32, @location(1) pos: vec2<u32>) -> Out {
  let w = size.x;
  let h = size.y;

  // let i = f32(instance);
  // let cell = vec2<f32>(i % w, floor(i / w));
  // let state = cell; // New line!

  // let cellOffset = cell / size * 2;
  // // New: Scale the position by the cell's active state.
  // let gridPos = (pos*state+1) / size - 1 + cellOffset;
  
  let x = (f32(instance % w + pos.x) / f32(w) - 0.5) * 2. * f32(w) / f32(max(w, h));
  let y = (f32((instance - (instance % w)) / w + pos.y) / f32(h) - 0.5) * 2. * f32(h) / f32(max(w, h));

  return Out(vec4<f32>(x, y, 0., 1.), f32(cell));
  // return Out(vec4<f32>(gridPos, 0, 1), cell);
}
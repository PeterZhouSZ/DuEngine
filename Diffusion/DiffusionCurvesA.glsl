// https://www.shadertoy.com/view/XdKGDW
vec3 p;
vec3 c;
float invZoom;

void F(vec3 abc,float d,vec3 cu,vec3 cv)
{
  vec2 t = vec2(dot(abc,p),dot(vec3(normalize(vec2(-abc.y,abc.x)),d),p)*invZoom);
  
  if (all(lessThan(abs(t),vec2(0.5,1.2))))
  {
    c = mix(cu,cv,clamp(t.y+0.5,0.0,1.0));
  }
}

void G(vec3 abc,float d,vec3 cu0,vec3 cv0,vec3 cu1,vec3 cv1)
{
  vec2 t = vec2(dot(abc,p),dot(vec3(normalize(vec2(-abc.y,abc.x)),d),p)*invZoom);
  
  if (all(lessThan(abs(t),vec2(0.5,1.2))))
  {
    c = mix(mix(vec3(cu0),vec3(cu1),t.x+0.5),
            mix(vec3(cv0),vec3(cv1),t.x+0.5),clamp(t.y+0.5,0.0,1.0));
  }
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{       
  fragColor = texture(iChannel0,fragCoord.xy/iResolution.xy);    
  
  vec2 lastResolution = texture(iChannel1,vec2(0,0)/iResolution.xy).yz;   
  
  if (any(notEqual(lastResolution,iResolution.xy)))
  {
    vec2 res = iResolution.xy;
    float zoom = (512.0/min(res.x,res.y));
    invZoom = 1.0/zoom;  
    float x = fragCoord.x-(res.x>res.y? 0.5*(res.x-res.y) : 0.0);
    float y = fragCoord.y-(res.y>res.x? 0.5*(res.y-res.x) : 0.0);
    p = vec3(x,res.y-y,1)*vec3(zoom,zoom,1);
    c = vec3(-1.0,-1.0,-1.0);  
    
    #define V(x,y,z) vec3(x,y,z)
    F(V( 1.847e-2,-8.695e-3,-3.573e+0),-1.968e+2,V(0.865,0.792,0.690),V(0.802,0.563,0.443));
    F(V( 2.936e-2,-7.285e-3,-7.583e+0),-1.540e+2,V(0.869,0.804,0.702),V(0.824,0.575,0.453));
    F(V( 2.849e-2,-3.442e-3,-8.650e+0),-1.201e+2,V(0.871,0.804,0.702),V(0.849,0.600,0.467));
    F(V( 2.305e-2, 3.347e-4,-8.157e+0),-7.619e+1,V(0.871,0.804,0.700),V(0.890,0.647,0.488));
    F(V( 5.245e-2, 1.355e-2,-2.124e+1), 1.463e+1,V(0.871,0.804,0.698),V(0.931,0.692,0.510));
    F(V( 2.121e-2, 1.058e-2,-9.731e+0), 9.796e+1,V(0.871,0.804,0.698),V(0.951,0.712,0.518));
    F(V( 3.850e-2, 3.341e-2,-2.057e+1), 2.025e+2,V(0.871,0.804,0.698),V(0.951,0.712,0.512));
    F(V( 1.871e-2, 2.400e-2,-1.165e+1), 2.783e+2,V(0.871,0.804,0.696),V(0.933,0.700,0.502));
    F(V( 2.113e-2, 4.093e-2,-1.622e+1), 3.472e+2,V(0.871,0.802,0.694),V(0.920,0.684,0.486));
    F(V( 7.287e-3, 2.079e-2,-7.352e+0), 3.943e+2,V(0.871,0.800,0.694),V(0.904,0.667,0.467));
    F(V(-5.015e-4, 1.585e-2,-3.519e+0), 4.963e+2,V(0.871,0.800,0.692),V(0.876,0.637,0.437));
    F(V(-5.128e-3, 1.776e-2,-2.776e+0), 5.435e+2,V(0.871,0.800,0.688),V(0.841,0.600,0.402));
    F(V(-1.018e-2, 1.782e-2,-1.405e+0), 5.699e+2,V(0.871,0.798,0.686),V(0.808,0.571,0.373));
    G(V(-1.623e-2, 1.964e-2,-3.530e-1), 5.774e+2,V(0.871,0.796,0.686),V(0.796,0.557,0.357),V(0.871,0.796,0.686),V(0.698,0.439,0.271));
    G(V(-3.044e-2, 2.970e-2, 7.092e-1), 5.777e+2,V(0.871,0.796,0.686),V(0.698,0.439,0.271),V(0.871,0.796,0.686),V(0.592,0.298,0.149));
    F(V(-2.531e-2, 1.755e-2, 2.608e+0), 5.688e+2,V(0.871,0.796,0.684),V(0.553,0.269,0.131));
    F(V(-5.412e-2, 1.791e-2, 1.241e+1), 5.263e+2,V(0.876,0.806,0.692),V(0.506,0.247,0.124));
    F(V(-2.956e-2, 2.420e-3, 9.198e+0), 4.622e+2,V(0.876,0.806,0.692),V(0.482,0.275,0.155));
    F(V(-1.217e-1,-5.024e-2, 6.161e+1), 2.778e+2,V(0.871,0.796,0.680),V(0.459,0.284,0.173));
    F(V(-4.199e-2,-6.487e-2, 4.121e+1),-3.540e+1,V(0.871,0.796,0.678),V(0.443,0.249,0.153));
    F(V(-1.271e-2,-9.759e-2, 4.480e+1),-2.587e+2,V(0.871,0.796,0.678),V(0.420,0.184,0.116));
    G(V(-3.892e-2,-8.238e-2, 4.576e+1),-1.082e+2,V(0.871,0.796,0.678),V(0.404,0.145,0.094),V(0.631,0.506,0.447),V(0.384,0.090,0.059));
    F(V(-1.060e-2,-3.818e-2, 1.189e+1),-3.969e+2,V(0.941,0.394,0.175),V(0.961,0.525,0.318));
    F(V(-1.676e-3,-5.332e-2, 9.371e+0),-4.537e+2,V(0.941,0.388,0.163),V(0.967,0.565,0.365));
    F(V(-2.535e-2,-6.850e-2, 2.154e+1),-3.774e+2,V(0.941,0.382,0.153),V(0.973,0.596,0.406));
    F(V(-2.258e-2,-2.388e-2, 1.307e+1),-2.342e+2,V(0.941,0.375,0.139),V(0.980,0.631,0.455));
    F(V(-2.576e-2,-1.661e-2, 1.260e+1),-1.364e+2,V(0.941,0.367,0.124),V(0.988,0.675,0.510));
    F(V(-5.763e-2,-1.987e-2, 2.484e+1),-3.829e+1,V(0.941,0.361,0.114),V(0.994,0.702,0.543));
    G(V(-3.545e-2,-5.564e-3, 1.385e+1), 3.235e+1,V(0.941,0.357,0.110),V(0.996,0.710,0.553),V(0.941,0.353,0.094),V(0.965,0.596,0.420));
    F(V(-4.447e-2,-1.270e-3, 1.574e+1), 7.926e+1,V(0.941,0.349,0.090),V(0.955,0.573,0.390));
    G(V(-2.180e-2, 2.899e-3, 6.656e+0), 1.331e+2,V(0.941,0.345,0.086),V(0.945,0.549,0.361),V(0.929,0.404,0.192),V(0.918,0.671,0.486));
    G(V(-1.685e-2, 5.304e-3, 3.966e+0), 1.792e+2,V(0.929,0.404,0.192),V(0.918,0.671,0.486),V(0.910,0.478,0.325),V(0.847,0.643,0.471));
    G(V(-4.974e-2, 2.895e-3, 1.086e+1), 1.625e+2,V(0.839,0.357,0.294),V(0.322,0.165,0.318),V(0.875,0.427,0.400),V(0.325,0.161,0.341));
    G(V(-1.436e-1,-1.354e-1, 5.100e+1),-3.961e+1,V(0.875,0.427,0.400),V(0.325,0.161,0.341),V(0.929,0.510,0.518),V(0.329,0.157,0.361));
    F(V( 4.996e-2,-9.580e-2, 2.898e+0),-2.569e+2,V(0.902,0.504,0.522),V(0.327,0.155,0.355));
    F(V( 7.279e-2,-6.106e-2,-7.882e+0),-2.459e+2,V(0.892,0.510,0.522),V(0.322,0.151,0.329));
    F(V( 3.015e-2,-1.022e-2,-5.957e+0),-1.972e+2,V(0.918,0.525,0.484),V(0.302,0.141,0.253));
    F(V( 1.157e-1, 4.846e-3,-3.063e+1),-1.108e+2,V(0.927,0.531,0.443),V(0.329,0.161,0.216));
    F(V( 1.017e-2,-7.533e-2, 1.460e+1),-4.638e+2,V(0.894,0.271,0.043),V(0.241,0.084,0.069));
    F(V( 2.975e-2,-6.748e-2, 3.166e+0),-4.970e+2,V(0.892,0.271,0.041),V(0.208,0.076,0.112));
    F(V( 6.345e-2,-5.180e-2,-1.634e+1),-4.593e+2,V(0.890,0.271,0.037),V(0.180,0.078,0.149));
    F(V( 1.557e-1,-2.057e-2,-6.588e+1),-2.828e+2,V(0.890,0.271,0.035),V(0.208,0.100,0.151));
    F(V( 8.253e-2, 9.644e-2,-5.983e+1), 2.001e+2,V(0.888,0.269,0.033),V(0.220,0.114,0.149));
    F(V( 1.509e-2, 4.913e-2,-1.881e+1), 3.730e+2,V(0.886,0.267,0.029),V(0.210,0.129,0.149));
    F(V( 6.334e-5, 3.008e-2,-8.038e+0), 4.663e+2,V(0.882,0.265,0.024),V(0.247,0.180,0.135));
    F(V(-4.166e-2, 1.148e-1,-1.352e+1), 5.354e+2,V(0.878,0.263,0.018),V(0.275,0.206,0.120));
    F(V(-7.578e-2, 6.028e-2, 1.716e+1), 5.163e+2,V(0.876,0.263,0.014),V(0.275,0.182,0.102));
    F(V(-7.372e-2,-4.519e-2, 4.654e+1), 1.486e+1,V(0.873,0.261,0.010),V(0.273,0.161,0.084));
    F(V(-5.284e-2,-5.599e-2, 3.936e+1),-1.248e+2,V(0.871,0.259,0.006),V(0.278,0.145,0.071));
    F(V(-2.957e-2,-8.216e-2, 3.555e+1),-3.161e+2,V(0.869,0.259,0.002),V(0.278,0.127,0.057));
    F(V(-2.773e-3,-8.549e-2, 2.384e+1),-4.244e+2,V(0.859,0.257,0.000),V(0.269,0.114,0.049));
    F(V( 2.116e-2,-2.438e-2, 4.532e-1),-5.579e+2,V(0.763,0.245,0.125),V(0.394,0.220,0.129));
    G(V( 8.398e-2,-2.830e-2,-2.565e+1),-4.804e+2,V(0.800,0.247,0.122),V(0.408,0.216,0.118),V(0.773,0.318,0.176),V(0.635,0.341,0.208));
    G(V( 1.084e-1, 2.567e-1,-1.401e+2), 2.584e+2,V(0.773,0.318,0.176),V(0.635,0.341,0.208),V(0.749,0.416,0.251),V(0.569,0.345,0.220));
    F(V(-6.519e-2, 1.694e-1,-3.388e+1), 5.363e+2,V(0.729,0.441,0.273),V(0.529,0.343,0.227));
    F(V(-1.802e-2, 2.033e-2,-2.199e-1), 5.687e+2,V(0.688,0.429,0.271),V(0.441,0.322,0.225));
    F(V(-8.998e-2, 3.399e-2, 2.272e+1), 5.156e+2,V(0.665,0.351,0.220),V(0.431,0.282,0.198));
    G(V(-3.113e-1,-4.256e-1, 2.940e+2),-8.492e+1,V(0.663,0.310,0.192),V(0.471,0.263,0.180),V(0.659,0.271,0.169),V(0.345,0.263,0.192));
    F(V( 3.282e-2,-7.547e-2, 1.659e+1),-5.234e+2,V(0.661,0.257,0.157),V(0.343,0.257,0.188));
    G(V( 1.319e-2,-5.817e-2, 1.077e+1),-3.382e+2,V(0.773,0.251,0.153),V(0.212,0.176,0.188),V(0.831,0.376,0.290),V(0.322,0.298,0.314));
    G(V( 9.443e-2,-1.120e-1,-8.656e-1),-3.794e+2,V(0.831,0.376,0.290),V(0.322,0.298,0.314),V(0.863,0.510,0.447),V(0.455,0.388,0.420));
    G(V( 6.585e-2,-2.626e-2,-1.376e+1),-3.302e+2,V(0.863,0.510,0.447),V(0.455,0.388,0.420),V(0.902,0.635,0.588),V(0.608,0.612,0.635));
    G(V( 5.610e-2, 2.501e-3,-1.843e+1),-2.182e+2,V(0.902,0.635,0.588),V(0.608,0.612,0.635),V(0.945,0.776,0.753),V(0.792,0.820,0.851));
    G(V( 4.972e-2, 2.266e-2,-2.204e+1),-7.637e+1,V(0.945,0.776,0.753),V(0.792,0.820,0.851),V(0.988,0.914,0.910),V(0.851,0.867,0.894));
    G(V( 3.986e-2, 3.630e-2,-2.293e+1), 5.351e+1,V(0.988,0.914,0.910),V(0.851,0.867,0.894),V(0.973,0.792,0.769),V(0.816,0.769,0.788));
    G(V( 2.154e-2, 4.780e-2,-2.030e+1), 2.218e+2,V(0.973,0.792,0.769),V(0.816,0.769,0.788),V(0.953,0.675,0.624),V(0.784,0.690,0.702));
    F(V( 7.137e-3, 9.442e-2,-2.864e+1), 3.438e+2,V(0.955,0.676,0.627),V(0.784,0.690,0.702));
    G(V( 5.467e-2, 2.432e-2,-2.244e+1),-9.847e+1,V(0.573,0.522,0.557),V(0.251,0.255,0.322),V(0.612,0.620,0.655),V(0.239,0.251,0.325));
    F(V( 3.938e-2, 4.632e-2,-2.411e+1), 7.718e+1,V(0.627,0.651,0.694),V(0.224,0.235,0.298));
    F(V( 1.490e-2, 3.053e-2,-1.317e+1), 1.752e+2,V(0.629,0.653,0.704),V(0.190,0.196,0.251));
    F(V( 8.672e-2, 6.381e-2,-4.762e+1),-3.154e+1,V(0.612,0.620,0.671),V(0.178,0.169,0.220));
    F(V( 9.308e-2,-1.449e-2,-2.806e+1),-3.393e+2,V(0.629,0.629,0.675),V(0.222,0.190,0.220));
    F(V( 5.458e-2,-2.941e-2,-1.121e+1),-4.210e+2,V(0.678,0.659,0.694),V(0.278,0.229,0.237));
    F(V( 2.041e-2,-6.931e-2, 1.371e+1),-3.550e+2,V(0.986,0.927,0.737),V(0.131,0.071,0.118));
    F(V( 8.292e-2, 7.355e-3,-2.756e+1),-2.804e+2,V(0.124,0.039,0.092),V(0.982,0.796,0.496));
    F(V( 1.339e-1, 6.522e-2,-6.231e+1),-1.417e+2,V(0.153,0.033,0.057),V(0.990,0.782,0.447));
    F(V( 1.151e-1,-8.498e-4,-3.611e+1),-3.533e+2,V(0.845,0.380,0.137),V(0.441,0.100,0.059));
    F(V( 1.400e-1,-6.235e-2,-2.353e+1),-4.510e+2,V(0.847,0.412,0.163),V(0.496,0.124,0.057));
    G(V( 3.432e-2,-7.235e-2, 1.349e+1),-4.444e+2,V(0.847,0.431,0.180),V(0.533,0.141,0.055),V(0.910,0.561,0.271),V(0.643,0.192,0.051));
    G(V(        0,-5.000e-2, 1.635e+1),-3.320e+2,V(0.910,0.561,0.271),V(0.643,0.192,0.051),V(0.953,0.678,0.357),V(0.741,0.239,0.047));
    F(V( 8.267e-2,-2.517e-1, 4.478e+1),-3.193e+2,V(0.824,0.235,0.180),V(0.984,0.665,0.482));
    F(V( 1.224e-1,-7.335e-2,-1.228e+1),-3.508e+2,V(0.798,0.210,0.153),V(0.976,0.686,0.506));
    F(V( 5.295e-2, 3.348e-3,-1.497e+1),-2.381e+2,V(0.792,0.229,0.122),V(0.935,0.696,0.480));
    G(V( 5.200e-2, 3.600e-2,-2.407e+1),-5.338e+1,V(0.788,0.243,0.102),V(0.902,0.686,0.447),V(0.769,0.255,0.059),V(0.937,0.769,0.545));
    F(V( 6.021e-3, 2.158e-2,-8.946e+0), 2.052e+2,V(0.941,0.643,0.373),V(0.263,0.220,0.243));
    F(V( 1.778e-2, 1.333e-2,-8.438e+0),-5.960e+1,V(0.984,0.867,0.718),V(0.718,0.698,0.690));
    F(V( 1.545e-2, 5.691e-3,-4.837e+0),-1.598e+2,V(0.824,0.357,0.349),V(0.369,0.376,0.439));
    F(V( 2.592e-3, 3.251e-2,-1.272e+1), 2.821e+2,V(0.553,0.102,0.061),V(0.110,0.076,0.102));
    F(V(-6.673e-3, 4.355e-2,-1.503e+1), 3.676e+2,V(0.467,0.108,0.084),V(0.118,0.094,0.114));
    F(V( 3.724e-2,-1.013e-2,-8.996e-1),-1.220e+2,V(0.859,0.780,0.682),V(0.647,0.639,0.914));
    F(V( 1.254e-2,-9.843e-4,-1.234e+0),-1.131e+2,V(0.865,0.778,0.667),V(0.698,0.680,0.884));
    F(V( 2.281e-2, 1.052e-3,-3.943e+0),-9.514e+1,V(0.876,0.775,0.645),V(0.763,0.733,0.845));
    F(V( 2.922e-2, 9.425e-3,-7.032e+0),-4.065e+1,V(0.878,0.775,0.657),V(0.808,0.769,0.820));
    F(V( 5.177e-2, 1.497e-2,-8.786e-1),-6.296e+0,V(0.486,0.422,0.769),V(0.782,0.753,0.910));
    F(V( 4.237e-2, 2.978e-2,-1.859e+0), 2.363e+0,V(0.494,0.431,0.773),V(0.771,0.741,0.908));
    F(V( 3.028e-2, 4.213e-2,-2.692e+0), 1.721e+1,V(0.494,0.431,0.773),V(0.751,0.724,0.904));
    F(V( 3.385e-2, 9.831e-2,-6.112e+0), 3.416e+1,V(0.494,0.431,0.773),V(0.741,0.714,0.902));
    F(V( 7.500e-2,-7.327e-2, 6.176e+0),-1.797e+2,V(0.625,0.612,0.963),V(0.569,0.539,0.929));
    F(V( 3.901e-2,-1.982e-2,-5.896e-1),-1.876e+2,V(0.671,0.641,0.963),V(0.610,0.565,0.941));
    F(V( 5.937e-2,-1.450e-2,-4.602e+0),-1.770e+2,V(0.722,0.671,0.963),V(0.653,0.590,0.953));
    F(V( 2.019e-2,-4.604e-4,-2.916e+0),-1.549e+2,V(0.784,0.706,0.965),V(0.708,0.624,0.969));
    F(V( 5.626e-2, 2.200e-2,-1.353e+1),-7.774e+1,V(0.847,0.741,0.965),V(0.767,0.661,0.982));
    F(V( 3.587e-2,-6.560e-3, 5.138e-1),-1.576e+2,V(0.635,0.637,0.951),V(0.576,0.569,0.918));
    F(V( 4.739e-2, 2.750e-4,-1.868e+0),-1.549e+2,V(0.635,0.635,0.955),V(0.575,0.569,0.922));
    F(V( 5.755e-2, 1.738e-2,-6.022e+0),-1.344e+2,V(0.635,0.629,0.961),V(0.573,0.569,0.924));
    F(V( 4.118e-2, 3.529e-2,-8.824e+0),-7.918e+1,V(0.635,0.624,0.969),V(0.571,0.569,0.927));
    G(V(-2.512e-3,-2.654e-2, 5.957e+0),-5.442e+1,V(0.490,0.471,0.855),V(0.443,0.404,0.831),V(0.576,0.573,0.929),V(0.486,0.455,0.871));
    F(V( 8.672e-3,-3.539e-2, 5.893e+0),-1.186e+2,V(0.590,0.586,0.943),V(0.502,0.473,0.884));
    F(V( 3.981e-2,-7.321e-2, 1.925e+1),-1.334e+2,V(0.506,0.502,0.843),V(0.567,0.553,0.914));
    F(V( 5.859e-2,-6.032e-2, 1.470e+1),-1.891e+2,V(0.508,0.514,0.829),V(0.563,0.543,0.914));
    F(V( 3.576e-2,-1.821e-2, 3.462e+0),-2.336e+2,V(0.506,0.522,0.804),V(0.555,0.527,0.914));
    G(V( 3.708e-2,-5.772e-3,-5.967e-1),-2.449e+2,V(0.502,0.522,0.788),V(0.549,0.518,0.914),V(0.431,0.412,0.788),V(0.537,0.498,0.914));
    F(V( 4.258e-2, 2.798e-3,-3.999e+0),-2.326e+2,V(0.406,0.369,0.786),V(0.531,0.486,0.912));
    F(V( 7.337e-2, 2.122e-2,-1.217e+1),-2.046e+2,V(0.390,0.339,0.776),V(0.522,0.465,0.912));
    F(V( 3.019e-2, 2.526e-2,-9.724e+0),-1.204e+2,V(0.416,0.371,0.761),V(0.510,0.443,0.912));
    F(V( 2.063e-2,-3.706e-2, 1.419e+0),-2.415e+2,V(0.851,0.796,0.924),V(0.943,0.525,0.555));
    F(V( 2.211e-2,-2.536e-2,-1.474e+0),-2.407e+2,V(0.851,0.786,0.865),V(0.898,0.506,0.527));
    F(V( 1.604e-2,-4.671e-2, 5.630e+0),-2.266e+2,V(0.655,0.545,0.908),V(0.945,0.480,0.496));
    G(V( 2.889e-2,-5.095e-2, 3.038e+0),-2.419e+2,V(0.678,0.576,0.945),V(0.953,0.482,0.498),V(0.776,0.694,0.961),V(0.953,0.482,0.494));
    F(V( 2.441e-8, 4.000e-2,-8.180e+0), 1.740e+2,V(0.892,0.455,0.476),V(0.227,0.159,0.249));
    F(V( 2.935e-2, 4.908e-2,-1.626e+1), 3.798e+1,V(0.878,0.441,0.463),V(0.194,0.129,0.220));
    F(V( 5.561e-2, 5.539e-2,-2.353e+1),-3.524e+1,V(0.861,0.422,0.445),V(0.206,0.137,0.220));
    F(V(-1.127e-2,-2.163e-2, 6.740e+0),-4.830e+1,V(0.506,0.441,0.829),V(0.210,0.208,0.296));
    F(V(-2.581e-3,-2.158e-1, 4.408e+1),-1.586e+2,V(0.539,0.473,0.853),V(0.216,0.208,0.275));
    F(V( 5.579e-2,-3.433e-2,-2.616e+0),-2.547e+2,V(0.573,0.504,0.873),V(0.214,0.182,0.245));
    F(V(-9.827e-2, 9.095e-2,-4.731e+0), 2.991e+2,V(0.235,0.243,0.371),V(0.408,0.345,0.751));
    F(V(-3.798e-2, 8.344e-2,-1.440e+1), 2.608e+2,V(0.225,0.229,0.355),V(0.394,0.337,0.686));
    G(V(-3.412e-2,-3.529e-3, 6.132e+0), 2.364e+2,V(0.714,0.702,0.792),V(0.404,0.341,0.757),V(0.478,0.443,0.510),V(0.427,0.369,0.796));
    G(V(-4.968e-2, 2.023e-2, 1.306e+0), 2.858e+2,V(0.478,0.443,0.510),V(0.427,0.369,0.796),V(0.627,0.596,0.741),V(0.475,0.424,0.792));
    G(V(-5.214e-2, 4.447e-2,-5.673e+0), 2.761e+2,V(0.627,0.596,0.741),V(0.475,0.424,0.792),V(0.522,0.490,0.647),V(0.545,0.490,0.871));
    G(V(-1.229e-2, 1.580e-2,-3.382e+0), 2.522e+2,V(0.522,0.490,0.647),V(0.545,0.490,0.871),V(0.702,0.651,0.710),V(0.749,0.706,0.980));
    G(V(-4.467e-2, 3.813e-2,-8.671e+0), 2.861e+2,V(0.702,0.651,0.710),V(0.749,0.706,0.980),V(0.259,0.235,0.337),V(0.690,0.651,0.929));
    G(V(-4.475e-2, 1.193e-2,-1.308e+0), 3.255e+2,V(0.259,0.235,0.337),V(0.690,0.651,0.929),V(0.380,0.333,0.416),V(0.631,0.604,0.933));
    G(V(-2.080e-2, 1.824e-2,-5.459e+0), 2.745e+2,V(0.380,0.333,0.416),V(0.631,0.604,0.933),V(0.243,0.188,0.333),V(0.525,0.502,0.808));
    G(V( 1.534e-2, 1.753e-1,-6.186e+1),-1.150e+1,V(0.243,0.188,0.333),V(0.525,0.502,0.808),V(0.541,0.486,0.631),V(0.506,0.478,0.733));
    F(V( 1.432e-1, 1.276e-1,-4.847e+1),-2.514e+2,V(0.524,0.476,0.637),V(0.502,0.473,0.714));
    G(V( 2.135e-2,-4.724e-2, 1.589e+1),-1.685e+2,V(0.506,0.467,0.643),V(0.498,0.467,0.694),V(0.490,0.439,0.659),V(0.584,0.565,0.894));
    G(V( 8.841e-2,-7.029e-2, 2.063e+1),-2.856e+2,V(0.490,0.439,0.659),V(0.584,0.565,0.894),V(0.329,0.278,0.439),V(0.553,0.510,0.765));
    G(V( 3.149e-2, 1.224e-1,-4.264e+1),-4.630e+1,V(0.329,0.278,0.439),V(0.553,0.510,0.765),V(0.537,0.494,0.643),V(0.518,0.478,0.761));
    G(V( 1.687e-2,-7.129e-3, 1.261e+0),-3.308e+2,V(0.537,0.494,0.643),V(0.518,0.478,0.761),V(0.467,0.392,0.565),V(0.671,0.620,0.957));
    F(V( 7.264e-2,-5.655e-2, 1.107e+1),-3.087e+2,V(0.469,0.398,0.555),V(0.651,0.602,0.945));
    F(V( 2.918e-2,-3.709e-2, 8.262e+0),-2.721e+2,V(0.476,0.429,0.539),V(0.594,0.549,0.910));
    G(V( 1.489e-2,-2.679e-2, 5.801e+0),-2.425e+2,V(0.482,0.455,0.533),V(0.557,0.514,0.886),V(0.286,0.267,0.369),V(0.443,0.408,0.812));
    G(V( 8.284e-2,-4.799e-2, 1.807e+0),-2.969e+2,V(0.286,0.267,0.369),V(0.443,0.408,0.812),V(0.157,0.114,0.267),V(0.408,0.376,0.780));
    G(V( 1.120e-1, 6.946e-2,-3.417e+1),-1.519e+2,V(0.157,0.114,0.267),V(0.408,0.376,0.780),V(0.416,0.353,0.435),V(0.455,0.427,0.784));
    F(V( 4.271e-2, 8.740e-2,-3.003e+1), 1.136e+1,V(0.404,0.369,0.437),V(0.443,0.418,0.773));
    G(V( 7.692e-2, 5.128e-2,-2.609e+1),-1.484e+2,V(0.392,0.384,0.439),V(0.431,0.408,0.761),V(0.376,0.427,0.447),V(0.357,0.349,0.655));
    F(V( 1.375e-2,-3.093e-2, 6.064e+0),-2.580e+2,V(0.345,0.333,0.365),V(0.200,0.196,0.267));
    F(V(-8.333e-3, 3.907e-2,-1.025e+1), 2.126e+2,V(0.792,0.812,0.751),V(0.361,0.341,0.624));
    F(V( 3.138e-3, 5.837e-2,-1.893e+1), 1.351e+2,V(0.771,0.769,0.724),V(0.363,0.329,0.606));
    F(V( 2.545e-1, 1.108e-1,-7.532e+1),-2.367e+2,V(0.771,0.749,0.704),V(0.384,0.333,0.643));
    G(V( 4.774e-2,-4.790e-2, 5.513e+0),-3.103e+2,V(0.361,0.400,0.427),V(0.776,0.835,0.784),V(0.145,0.176,0.227),V(0.792,0.839,0.780));
    G(V( 2.159e-1,-5.902e-2,-2.063e+1),-3.061e+2,V(0.145,0.176,0.227),V(0.792,0.839,0.780),V(0.220,0.251,0.310),V(0.808,0.847,0.780));
    F(V( 2.752e-2, 2.540e-2,-1.209e+1),-8.219e+1,V(0.227,0.247,0.306),V(0.837,0.859,0.775));
    G(V( 5.380e-2, 8.159e-2,-3.433e+1), 9.701e-1,V(0.235,0.243,0.302),V(0.867,0.871,0.769),V(0.161,0.153,0.204),V(0.859,0.851,0.749));
    F(V( 4.511e-3, 6.596e-2,-2.098e+1), 1.763e+2,V(0.151,0.133,0.180),V(0.882,0.869,0.757));
    G(V(-1.097e-2, 2.686e-2,-6.710e+0), 3.013e+2,V(0.141,0.114,0.157),V(0.906,0.886,0.765),V(0.251,0.212,0.239),V(0.929,0.898,0.761));
    F(V( 6.603e-2, 1.030e-3,-1.114e+1),-3.235e+2,V(0.808,0.780,0.714),V(0.076,0.061,0.096));
    F(V( 1.318e-1, 6.114e-2,-4.300e+1),-2.239e+2,V(0.829,0.806,0.718),V(0.075,0.059,0.094));
    F(V( 6.012e-2, 8.422e-2,-3.888e+1),-4.686e+1,V(0.835,0.820,0.722),V(0.075,0.059,0.094));
    G(V( 2.941e-2, 1.176e-1,-4.553e+1), 9.580e+1,V(0.831,0.820,0.722),V(0.075,0.059,0.094),V(0.620,0.584,0.522),V(0.086,0.063,0.102));
    G(V(-1.078e-2, 4.602e-2,-1.571e+1), 3.937e+2,V(0.729,0.608,0.541),V(0.137,0.122,0.129),V(0.804,0.737,0.616),V(0.145,0.133,0.133));
    G(V(-1.892e-1, 1.307e-1, 1.849e+0), 5.220e+2,V(0.804,0.737,0.616),V(0.145,0.133,0.133),V(0.796,0.753,0.620),V(0.063,0.059,0.075));
    F(V(-6.618e-3, 5.144e-2,-2.042e+1), 3.535e+2,V(0.812,0.759,0.625),V(0.096,0.092,0.100));
    F(V(-1.440e-1, 1.502e-1,-2.428e+1), 5.240e+2,V(0.824,0.757,0.627),V(0.104,0.100,0.102));
    F(V(-1.635e-1, 3.756e-2, 3.100e+1), 5.035e+2,V(0.820,0.747,0.624),V(0.073,0.069,0.073));
    G(V( 2.656e-2, 1.557e-2,-1.390e+1),-2.480e+2,V(0.063,0.055,0.067),V(0.157,0.141,0.184),V(0.055,0.043,0.055),V(0.286,0.275,0.325));   
    G(V( 8.339e-2,-2.964e-3,-2.235e+1),-4.600e+2,V(0.055,0.043,0.055),V(0.286,0.275,0.325),V(0.059,0.043,0.059),V(0.761,0.722,0.522));    
    F(V( 3.564e-2,-7.828e-3,-5.492e+0),-4.355e+2,V(0.051,0.033,0.051),V(0.761,0.722,0.522));
    F(V( 9.572e-2, 2.969e-2,-3.637e+1),-2.974e+2,V(0.055,0.041,0.057),V(0.792,0.767,0.563));
    F(V( 7.858e-2, 9.136e-2,-5.710e+1),-5.669e+1,V(0.076,0.065,0.073),V(0.798,0.782,0.580));
    F(V( 8.280e-3, 3.738e-2,-1.765e+1), 1.760e+2,V(0.082,0.073,0.080),V(0.771,0.751,0.557));
    F(V(-1.314e-1, 1.851e-1,-4.307e+1), 4.697e+2,V(0.088,0.080,0.088),V(0.731,0.704,0.520));
    G(V(-4.489e-2, 1.195e-2, 6.579e+0), 4.840e+2,V(0.090,0.082,0.090),V(0.722,0.694,0.514),V(0.220,0.216,0.180),V(0.722,0.690,0.502));
    F(V( 3.869e-2, 1.132e-1,-5.409e+1), 8.667e+1,V(0.669,0.586,0.406),V(0.078,0.063,0.094));
    G(V(-1.495e-2, 4.479e-2,-1.516e+1), 3.458e+2,V(0.643,0.573,0.396),V(0.078,0.063,0.094),V(0.545,0.506,0.349),V(0.078,0.063,0.094));
    F(V( 6.832e-2, 8.523e-2,-5.181e+1),-9.198e+1,V(0.712,0.680,0.494),V(0.090,0.076,0.129));
    F(V( 7.807e-2, 2.462e-2,-2.889e+1),-3.427e+2,V(0.712,0.680,0.494),V(0.106,0.094,0.133));
    F(V( 9.357e-2,-7.190e-3,-1.977e+1),-4.519e+2,V(0.718,0.686,0.498),V(0.124,0.112,0.137));
    F(V( 5.427e-2,-1.662e-1, 5.098e+1),-2.676e+2,V(0.086,0.073,0.102),V(0.667,0.684,0.514));
    G(V( 8.039e-2,-7.253e-2, 1.219e+1),-3.759e+2,V(0.098,0.086,0.110),V(0.678,0.694,0.525),V(0.075,0.059,0.094),V(0.796,0.792,0.624));
    F(V( 1.288e-1, 6.029e-2,-4.380e+1),-2.455e+2,V(0.073,0.055,0.094),V(0.794,0.786,0.625));
    G(V( 6.235e-8, 6.392e-2,-2.315e+1), 1.780e+2,V(0.071,0.051,0.094),V(0.792,0.780,0.627),V(0.071,0.047,0.094),V(0.678,0.667,0.541));
    G(V(-7.400e-2, 7.819e-2,-1.626e+1), 3.836e+2,V(0.071,0.047,0.094),V(0.678,0.667,0.541),V(0.071,0.051,0.094),V(0.533,0.522,0.427));
    F(V(-1.464e-1,-6.332e-2, 4.847e+1), 2.776e+2,V(0.071,0.051,0.094),V(0.504,0.494,0.406));
    G(V(-2.120e-2,-8.345e-2, 3.425e+1),-6.859e+1,V(0.071,0.051,0.094),V(0.475,0.467,0.384),V(0.129,0.118,0.137),V(0.561,0.565,0.439));
    F(V( 5.073e-2,-1.129e-1, 3.508e+1),-3.287e+2,V(0.035,0.033,0.063),V(0.641,0.637,0.478));
    F(V( 2.018e-1,-5.936e-2,-1.478e+1),-4.261e+2,V(0.047,0.045,0.075),V(0.684,0.682,0.514));
    G(V( 6.095e-2, 2.893e-2,-2.330e+1),-2.694e+2,V(0.047,0.047,0.078),V(0.706,0.706,0.529),V(0.051,0.055,0.063),V(0.792,0.788,0.600));
    F(V( 8.598e-2, 1.038e-1,-5.893e+1),-9.527e+1,V(0.063,0.057,0.078),V(0.757,0.753,0.576));
    F(V(-1.038e-1, 3.805e-1,-1.312e+2), 3.061e+2,V(0.075,0.059,0.094),V(0.735,0.731,0.561));
    G(V(-5.901e-2, 1.570e-2, 5.412e+0), 4.426e+2,V(0.075,0.059,0.094),V(0.749,0.745,0.569),V(0.075,0.063,0.098),V(0.498,0.502,0.345));
    F(V(-1.498e-1,-7.607e-2, 5.916e+1), 2.762e+2,V(0.075,0.063,0.098),V(0.514,0.518,0.363));
    F(V(-5.895e-2,-1.028e-1, 5.204e+1), 3.962e+1,V(0.086,0.075,0.106),V(0.549,0.551,0.398));
    F(V( 1.493e-2, 2.157e-2,-1.070e+1),-4.418e+1,V(0.065,0.057,0.090),V(0.108,0.076,0.120));
    F(V( 2.543e-2, 2.461e-2,-1.502e+1),-1.267e+2,V(0.063,0.047,0.073),V(0.080,0.045,0.080));
    F(V(-4.383e-3, 4.286e-2,-1.379e+1), 1.884e+2,V(0.088,0.075,0.112),V(0.355,0.292,0.675));
    F(V(-5.967e-2, 1.133e-1,-3.089e+1), 2.986e+2,V(0.090,0.075,0.110),V(0.347,0.288,0.651));
    F(V(-2.070e-2, 4.996e-2,-6.962e+0), 4.457e+2,V(0.784,0.296,0.143),V(0.237,0.182,0.180));
    F(V(-4.489e-2, 5.492e-2,-7.602e-1), 4.665e+2,V(0.778,0.304,0.147),V(0.210,0.145,0.145));
    F(V(-4.639e-2, 2.062e-2, 9.366e+0), 4.245e+2,V(0.743,0.304,0.149),V(0.194,0.118,0.120));
    F(V( 2.513e-2, 3.411e-2,-1.752e+1), 5.801e+1,V(0.145,0.110,0.157),V(0.706,0.690,0.678));
    F(V( 1.255e-1,-6.239e-2,-2.889e+1),-4.146e+2,V(0.945,0.643,0.580),V(0.898,0.478,0.357));
    G(V( 4.398e-2,-4.208e-2,-5.187e+0),-4.582e+2,V(0.941,0.631,0.561),V(0.898,0.475,0.349),V(0.910,0.525,0.416),V(0.902,0.439,0.278));
    F(V( 2.865e-2,-4.809e-2, 1.305e+0),-4.665e+2,V(0.902,0.502,0.384),V(0.904,0.425,0.247));
    F(V( 1.636e-2,-5.738e-2, 7.474e+0),-4.472e+2,V(0.900,0.508,0.390),V(0.906,0.412,0.216));
    G(V(-9.726e-3,-4.387e-2, 1.368e+1),-3.377e+2,V(0.906,0.537,0.427),V(0.906,0.412,0.216),V(0.925,0.647,0.557),V(0.906,0.416,0.224));
    F(V(-1.055e-2,-1.564e-2, 6.984e+0),-2.066e+2,V(0.920,0.614,0.524),V(0.906,0.414,0.220));
    F(V(-1.857e-2,-7.007e-2, 1.811e+1),-3.080e+2,V(0.910,0.565,0.473),V(0.906,0.412,0.216));
    F(V( 2.959e-2,-1.127e-2,-6.936e+0),-2.080e+2,V(0.963,0.447,0.278),V(0.863,0.475,0.404));
    F(V( 4.234e-2,-3.170e-3,-1.258e+1),-1.324e+2,V(0.957,0.427,0.241),V(0.869,0.484,0.425));
    F(V( 9.372e-2, 2.814e-2,-3.328e+1),-1.323e+1,V(0.949,0.400,0.192),V(0.876,0.496,0.445));
    F(V( 5.147e-2, 3.530e-2,-2.127e+1), 9.251e+1,V(0.939,0.382,0.165),V(0.880,0.508,0.463));
    F(V( 8.653e-2,-4.365e-2,-2.188e+1),-3.420e+2,V(0.992,0.855,0.831),V(0.988,0.973,0.969));
    F(V( 7.656e-2, 2.393e-4,-2.813e+1),-2.002e+2,V(0.992,0.855,0.831),V(0.988,0.973,0.969));
    F(V( 1.101e-1, 7.966e-2,-5.763e+1), 5.570e+1,V(0.992,0.855,0.829),V(0.988,0.973,0.967));
    F(V( 4.844e-2, 9.162e-2,-3.772e+1), 2.391e+2,V(0.992,0.855,0.827),V(0.988,0.973,0.965));
    F(V( 3.333e-3, 5.350e-2,-1.324e+1), 3.697e+2,V(0.990,0.855,0.827),V(0.988,0.971,0.965));
    F(V(-1.416e-1, 1.384e-1, 2.177e+1), 4.356e+2,V(0.986,0.847,0.816),V(0.988,0.969,0.963));
    F(V(-7.833e-2, 2.446e-2, 2.358e+1), 3.393e+2,V(0.986,0.845,0.814),V(0.986,0.969,0.961));
    F(V(-5.979e-2,-3.672e-3, 2.248e+1), 2.169e+2,V(0.988,0.851,0.822),V(0.984,0.969,0.959));
    F(V(-6.130e-2,-4.860e-2, 3.275e+1),-3.201e+1,V(0.986,0.851,0.820),V(0.984,0.967,0.957));
    F(V(-1.979e-2,-8.620e-2, 2.620e+1),-2.826e+2,V(0.984,0.851,0.818),V(0.984,0.965,0.955));
    F(V( 3.847e-2,-7.790e-2, 3.545e+0),-4.027e+2,V(0.982,0.849,0.814),V(0.984,0.965,0.953));
    F(V( 1.252e-1,-8.537e-2,-2.586e+1),-3.679e+2,V(0.982,0.849,0.814),V(0.984,0.965,0.953));
    F(V(-2.174e-2, 3.866e-2,-1.108e+0), 2.796e+2,V(0.794,0.425,0.357),V(0.847,0.318,0.216));
    F(V(-1.664e-2, 6.664e-2,-7.978e+0), 2.601e+2,V(0.814,0.429,0.355),V(0.847,0.318,0.216));
    F(V( 1.728e-2, 7.929e-2,-1.883e+1), 1.784e+2,V(0.831,0.435,0.355),V(0.847,0.318,0.216));
    F(V( 3.982e-2, 6.660e-2,-2.244e+1), 9.320e+1,V(0.847,0.439,0.355),V(0.853,0.308,0.194));
    F(V( 6.096e-2, 5.301e-2,-2.554e+1),-3.352e+0,V(0.861,0.439,0.351),V(0.861,0.296,0.171));
    F(V( 2.173e-2, 8.742e-3,-7.608e+0),-1.086e+2,V(0.884,0.443,0.349),V(0.855,0.304,0.188));
    F(V( 5.120e-2, 3.466e-2,-2.284e+1),-3.310e+1,V(0.906,0.447,0.349),V(0.845,0.316,0.214));
    F(V(-6.000e-2,-2.000e-2, 2.576e+1), 1.957e+2,V(0.941,0.714,0.384),V(0.188,0.059,0.055));
    F(V( 6.184e-2, 6.817e-2,-2.978e+1), 1.705e+2,V(0.418,0.445,0.533),V(0.475,0.510,0.604));
    F(V( 1.431e-2, 3.036e-2,-9.386e+0), 2.592e+2,V(0.398,0.414,0.496),V(0.475,0.510,0.604));
    G(V( 4.841e-2,-7.535e-2,-7.842e+0),-3.515e+2,V(0.725,0.459,0.408),V(0.439,0.475,0.569),V(0.882,0.420,0.259),V(0.443,0.475,0.569));
    F(V( 1.117e-1,-1.084e-2,-3.796e+1),-1.445e+2,V(0.884,0.416,0.247),V(0.431,0.453,0.537));
    G(V( 7.697e-2, 1.853e-2,-2.987e+1),-2.460e+1,V(0.886,0.412,0.235),V(0.420,0.431,0.506),V(0.882,0.416,0.247),V(0.361,0.341,0.396));
    F(V( 6.116e-2, 3.682e-2,-2.715e+1), 9.197e+1,V(0.882,0.416,0.247),V(0.376,0.353,0.406));
    G(V( 2.914e-2, 2.578e-2,-1.467e+1), 1.607e+2,V(0.882,0.416,0.247),V(0.392,0.365,0.416),V(0.882,0.412,0.247),V(0.522,0.502,0.557));
    F(V( 5.225e-2, 1.217e-1,-3.811e+1), 3.117e+2,V(0.880,0.414,0.247),V(0.524,0.506,0.563));
    F(V(-3.629e-2, 8.316e-2, 2.016e+0), 4.259e+2,V(0.880,0.416,0.247),V(0.494,0.480,0.541));
    F(V(-6.236e-2, 1.264e-2, 2.230e+1), 2.308e+2,V(0.882,0.416,0.247),V(0.422,0.425,0.496));
    F(V(-4.586e-2,-4.507e-3, 1.771e+1), 1.200e+2,V(0.882,0.418,0.253),V(0.375,0.382,0.457));
    F(V( 4.186e-3, 8.068e-2,-1.169e+1), 3.333e+2,V(0.475,0.510,0.604),V(0.908,0.586,0.498));
    F(V( 3.059e-2, 4.993e-2,-1.758e+1), 2.208e+2,V(0.475,0.510,0.604),V(0.910,0.588,0.498));
    F(V( 5.993e-2, 4.637e-2,-2.831e+1), 9.692e+1,V(0.475,0.502,0.592),V(0.910,0.588,0.498));
    G(V( 4.755e-2, 1.718e-1,-3.402e+1), 2.219e+2,V(0.725,0.404,0.349),V(0.357,0.220,0.255),V(0.914,0.506,0.408),V(0.357,0.220,0.255));
    F(V(-3.786e-2, 6.222e-2, 1.625e+0), 2.930e+2,V(0.900,0.484,0.404),V(0.357,0.220,0.255));
    F(V(-1.030e-1, 8.057e-2, 1.490e+1), 2.688e+2,V(0.882,0.457,0.398),V(0.357,0.220,0.255));
    F(V(-5.859e-2, 1.969e-2, 1.145e+1), 2.167e+2,V(0.873,0.443,0.394),V(0.357,0.220,0.255));
    F(V( 3.703e-2,-4.790e-2,-2.139e+0),-2.786e+2,V(0.325,0.153,0.310),V(0.357,0.220,0.255));
    F(V( 3.732e-2,-2.856e-2,-5.839e+0),-2.581e+2,V(0.312,0.147,0.269),V(0.357,0.220,0.255));
    F(V(-1.335e-2,-2.549e-2, 1.058e+1), 3.227e+1,V(0.529,0.406,0.447),V(0.400,0.333,0.724));
    F(V(-4.424e-2,-5.022e-2, 2.175e+1), 1.145e+2,V(0.571,0.437,0.476),V(0.439,0.367,0.784));
    G(V(-1.063e-1,-3.358e-2, 2.323e+1), 2.621e+2,V(0.588,0.451,0.490),V(0.475,0.408,0.808),V(0.404,0.282,0.416),V(0.580,0.529,0.878));
    G(V(-2.320e-1, 8.146e-2, 9.293e-1), 3.320e+2,V(0.404,0.282,0.416),V(0.580,0.529,0.878),V(0.533,0.455,0.702),V(0.671,0.635,0.937));
    G(V( 2.474e-2, 2.543e-2,-1.121e+1),-1.380e+2,V(0.533,0.455,0.702),V(0.671,0.635,0.937),V(0.522,0.392,0.561),V(0.502,0.459,0.749));
    G(V( 3.362e-2, 5.621e-2,-2.362e+1),-5.820e+1,V(0.522,0.392,0.561),V(0.502,0.459,0.749),V(0.412,0.290,0.471),V(0.396,0.349,0.639));
    G(V( 1.266e-2, 4.924e-2,-1.930e+1), 4.857e+1,V(0.412,0.290,0.471),V(0.396,0.349,0.639),V(0.553,0.475,0.596),V(0.294,0.243,0.537));
    G(V( 1.667e-1, 1.667e-1,-8.533e+1),-1.563e+2,V(0.553,0.475,0.596),V(0.294,0.243,0.537),V(0.659,0.600,0.761),V(0.380,0.345,0.600));
    F(V( 2.314e-2, 1.997e-2,-1.348e+1),-1.922e+2,V(0.078,0.075,0.145),V(0.390,0.329,0.331));
    G(V( 3.556e-2, 5.085e-2,-3.095e+1),-7.375e+1,V(0.067,0.067,0.141),V(0.376,0.318,0.302),V(0.051,0.055,0.137),V(0.729,0.698,0.671));
    G(V( 3.381e-2, 1.257e-1,-6.581e+1), 1.033e+2,V(0.051,0.055,0.137),V(0.729,0.698,0.671),V(0.059,0.059,0.141),V(0.592,0.549,0.522));
    G(V(-6.737e-2, 1.819e-1,-6.947e+1), 3.790e+2,V(0.059,0.059,0.141),V(0.592,0.549,0.522),V(0.067,0.067,0.145),V(0.427,0.369,0.341));
    G(V(-1.798e-1, 6.389e-2, 1.087e+1), 5.198e+2,V(0.067,0.067,0.145),V(0.427,0.369,0.341),V(0.129,0.129,0.192),V(0.541,0.467,0.439));
    G(V(-1.641e-1,-8.233e-2, 7.529e+1), 3.205e+2,V(0.129,0.129,0.192),V(0.541,0.467,0.439),V(0.220,0.212,0.298),V(0.651,0.561,0.541));
    G(V(-1.916e-2,-3.679e-2, 2.098e+1), 2.125e+1,V(0.220,0.212,0.298),V(0.651,0.561,0.541),V(0.329,0.290,0.529),V(0.176,0.090,0.090));
    G(V(-3.385e-2,-3.274e-2, 2.124e+1), 1.764e+2,V(0.329,0.290,0.529),V(0.176,0.090,0.090),V(0.247,0.212,0.412),V(0.376,0.247,0.227));
    F(V( 9.848e-3, 3.029e-2,-1.276e+1), 3.257e+1,V(0.071,0.061,0.108),V(0.341,0.347,0.365));
    F(V( 3.540e-2, 4.596e-2,-2.389e+1),-1.089e+2,V(0.061,0.051,0.096),V(0.347,0.353,0.337));
    G(V( 2.120e-2, 1.932e-2,-1.183e+1),-1.807e+2,V(0.059,0.047,0.090),V(0.333,0.337,0.322),V(0.067,0.063,0.098),V(0.251,0.251,0.255));
    G(V(-3.470e-2, 7.998e-2,-2.483e+1), 2.813e+2,V(0.392,0.392,0.510),V(0.365,0.322,0.592),V(0.235,0.227,0.365),V(0.353,0.310,0.580));
    G(V( 6.434e-3, 7.614e-2,-3.024e+1), 1.101e+2,V(0.235,0.227,0.365),V(0.353,0.310,0.580),V(0.110,0.106,0.200),V(0.282,0.275,0.471));
    G(V( 1.836e-2, 2.798e-2,-1.409e+1),-9.484e+1,V(0.110,0.106,0.200),V(0.282,0.275,0.471),V(0.110,0.102,0.133),V(0.361,0.314,0.592));
    F(V( 7.681e-2, 3.231e-2,-2.624e+1),-3.219e+2,V(0.131,0.122,0.145),V(0.361,0.314,0.592));
    F(V( 5.866e-2, 2.775e-3,-1.170e+1),-4.126e+2,V(0.165,0.153,0.165),V(0.361,0.314,0.592));
    F(V( 3.128e-2, 1.708e-2,-1.710e+1),-2.606e+2,V(0.820,0.737,0.624),V(0.429,0.459,0.576));
    G(V( 2.518e-2, 2.199e-2,-1.851e+1),-1.476e+2,V(0.820,0.737,0.624),V(0.447,0.478,0.592),V(0.820,0.737,0.624),V(0.529,0.557,0.659));
    G(V( 1.709e-2, 2.860e-2,-2.004e+1), 3.543e+1,V(0.820,0.737,0.624),V(0.529,0.557,0.659),V(0.820,0.737,0.624),V(0.612,0.635,0.722));
    G(V( 1.433e-2, 6.287e-2,-3.759e+1), 2.244e+2,V(0.820,0.737,0.624),V(0.612,0.635,0.722),V(0.816,0.737,0.624),V(0.725,0.690,0.663));
    F(V( 2.361e-2, 5.078e-2,-1.893e+1),-1.486e+2,V(0.398,0.363,0.714),V(0.161,0.147,0.363));
    G(V( 6.678e-3, 2.158e-2,-8.718e+0),-1.005e+2,V(0.404,0.369,0.718),V(0.153,0.141,0.349),V(0.420,0.392,0.722),V(0.067,0.063,0.188));
    F(V( 2.500e-2, 5.251e-2,-2.314e+1),-1.581e+2,V(0.408,0.380,0.702),V(0.073,0.069,0.202));
    F(V( 2.111e-2, 3.126e-2,-1.716e+1),-2.017e+2,V(0.120,0.114,0.286),V(0.029,0.029,0.135));
    F(V( 1.880e-2, 5.192e-2,-2.829e+1),-8.139e+1,V(0.096,0.096,0.247),V(0.029,0.029,0.125));
    G(V(-6.739e-2,-8.260e-2, 4.834e+1), 1.234e+2,V(0.361,0.310,0.592),V(0.216,0.129,0.125),V(0.361,0.310,0.592),V(0.325,0.267,0.251));
    F(V(-5.022e-3,-2.679e-1, 1.145e+2),-1.801e+2,V(0.355,0.306,0.580),V(0.355,0.298,0.288));
    F(V( 5.964e-2, 2.361e-2,-1.658e+1),-4.159e+2,V(0.259,0.253,0.482),V(0.125,0.112,0.275));
    F(V( 8.558e-2,-1.478e-2,-1.424e+0),-4.937e+2,V(0.208,0.206,0.418),V(0.108,0.092,0.233));
    F(V( 2.716e-2,-1.834e-2, 5.480e+0),-4.593e+2,V(0.176,0.176,0.375),V(0.104,0.088,0.218));
    F(V( 1.957e-2,-5.042e-3,-7.183e-1),-4.837e+2,V(0.188,0.182,0.373),V(0.098,0.082,0.188));
    F(V( 9.412e-2,-7.221e-2, 1.539e+1),-4.687e+2,V(0.202,0.188,0.363),V(0.094,0.078,0.163));
    F(V( 2.753e-2,-5.071e-2, 1.712e+1),-3.771e+2,V(0.216,0.196,0.359),V(0.090,0.075,0.147));
    F(V( 1.832e-2, 2.507e-2,-1.199e+1),-2.308e+2,V(0.351,0.331,0.616),V(0.069,0.057,0.225));
    F(V( 2.489e-2, 1.545e-2,-8.892e+0),-3.648e+2,V(0.331,0.316,0.584),V(0.055,0.049,0.192));
    F(V( 5.189e-2,-1.959e-2,-2.310e+0),-6.362e+1,V(0.453,0.390,0.737),V(0.851,0.773,0.682));
    F(V( 3.519e-2,-2.694e-2,-1.837e+0),-7.553e+1,V(0.475,0.412,0.759),V(0.859,0.780,0.682));
    F(V( 2.652e-2,-3.521e-2,-1.845e+0),-8.692e+1,V(0.508,0.445,0.794),V(0.857,0.780,0.682));
    F(V( 3.279e-2,-9.016e-2,-2.943e+0),-9.868e+1,V(0.527,0.467,0.816),V(0.857,0.780,0.682));
    F(V(-1.824e-2, 2.716e-2,-2.858e+0), 9.897e+1,V(0.618,0.624,0.949),V(0.569,0.553,0.867));
    F(V(-4.602e-2, 3.320e-2,-4.011e+0), 1.285e+2,V(0.637,0.647,0.957),V(0.506,0.494,0.859));
    F(V(-1.266e-1, 2.171e-2,-2.420e+0), 1.503e+2,V(0.649,0.663,0.961),V(0.465,0.453,0.851));
    F(V( 1.873e-3, 5.501e-2,-3.295e+0), 5.130e+1,V(0.859,0.788,0.661),V(0.722,0.694,0.898));
    F(V(-4.793e-3, 1.974e-2,-1.569e+0), 6.795e+1,V(0.849,0.778,0.680),V(0.708,0.680,0.892));
    G(V(-3.243e-3,-5.962e-2, 1.688e+1),-2.735e+2,V(0.980,0.929,0.725),V(0.153,0.094,0.125),V(0.773,0.251,0.153),V(0.082,0.039,0.075));

    fragColor = vec4(c,1);
  }
}
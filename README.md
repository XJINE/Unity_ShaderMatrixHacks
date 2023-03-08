# Unity_ShaderMatrixHacks

<img src="https://github.com/XJINE/Unity_ShaderMatrixHacks/blob/main/Screenshot.png" width="100%" height="auto" />

Get some parameters from shader matrix.

```hlsl
float3 cameraForward = -unity_MatrixV._m02_m12_m22;

float3 objectScale = float3(length(unity_ObjectToWorld._m00_m10_m20), 
                            length(unity_ObjectToWorld._m01_m11_m21),
			    length(unity_ObjectToWorld._m02_m12_m22));

float3 worldPosition = unity_ObjectToWorld._m03_m13_m23;
```

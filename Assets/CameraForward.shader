Shader "Unlit/CameraForward"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv     : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv     : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // NOTE:
                // '-(minus)' means to flip axis. some platform use reversed z.

                float3 cameraForward = -unity_MatrixV._m02_m12_m22;

                return float4(cameraForward.x, cameraForward.y, cameraForward.z, 1);
            }

            ENDCG
        }
    }
}

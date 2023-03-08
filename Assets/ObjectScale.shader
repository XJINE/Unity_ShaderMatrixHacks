Shader "Unlit/ObjectScale"
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

            float4 frag (v2f i) : SV_Target
            {
                float3 scale = float3(length(unity_ObjectToWorld._m00_m10_m20),
                                      length(unity_ObjectToWorld._m01_m11_m21),
                                      length(unity_ObjectToWorld._m02_m12_m22));

                return float4(scale.x, scale.y, scale.z, 1);
            }

            ENDCG
        }
    }
}

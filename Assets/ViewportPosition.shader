Shader "Unlit/ViewportPosition"
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
                // NOTE:
                // Clip space is a coordinate system ranging from -1 to 1.
                // And the Y-Axis is flipped.

                float4 clipPosition  = UnityWorldToClipPos(unity_ObjectToWorld._m03_m13_m23);

                float2 viewportPosition   = (clipPosition.xy + 1) * 0.5;
                       viewportPosition.y = 1 - viewportPosition.y;

                return float4(viewportPosition.x, viewportPosition.y, 0, 1);
                return float4(clipPosition.x,     clipPosition.y,     0, 1);
            }

            ENDCG
        }
    }
}

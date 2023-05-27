Shader "Holistic/FragVer/47"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {

        Pass
        {
            Tags{ "LightMode" = "ForwardBase"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase nolightmap nodirlightmap nodynlightmap novertexlight
            // make fog work

            #include "Lighting.cginc"
            #include "AutoLight.cginc"
            #include "UnityCG.cginc"
            #include "UnityLightingCommon.cginc"

            struct MeshData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord: TEXCOORD0;
                
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 diff: COLOR0;
                float4 pos : SV_POSITION;
                SHADOW_COORDS(1)
            };

            v2f vert (MeshData v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv  = v.texcoord;
                half3 worldNormal = UnityObjectToWorldNormal(v.normal);
                half nl = max(0, dot(worldNormal,_WorldSpaceLightPos0.xyz));
                o.diff = nl * _LightColor0;
                TRANSFER_SHADOW(o)
                return o;
            }

            sampler2D _MainTex;
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                fixed shadow = SHADOW_ATTENUATION(i);
                col *= i.diff * shadow;
                return col;
            }
            ENDCG
        }
        
        
        Pass
        {
            Tags{ "LightMode" = "ShadowCaster"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_shadowcaster
            // make fog work

            #include "UnityCG.cginc"

            struct MeshData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord: TEXCOORD0;
                
            };

            struct v2f
            {
                V2F_SHADOW_CASTER;
            };

            v2f vert (MeshData v)
            {
                v2f o;
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        
    }
}


Shader "Holistic/Advanced/52"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _OutLineColor ("Outline Color", Color) = (0,0,0,1)
        _Outline ("Outline Width", Range(0.002, 0.1))= 0.005
    }
    SubShader
    {
        Tags{
            "RenderType"= "Transparent"
            "Queue"= "Transparent"
        }
        ZWrite off
        CGPROGRAM

            #pragma surface surf Lambert vertex:vert

            struct Input {
                float2 uv_MainTex;
            };

            float _Outline;
            float4 _OutLineColor;
            void vert(inout appdata_full v){
                v.vertex.xyz += v.normal * _Outline;
            }
            sampler2D _MainTex;
            void surf(Input IN, inout SurfaceOutput o){
                o.Emission = _OutLineColor.rgb;
            }
        ENDCG

        ZWrite on        
        CGPROGRAM

        #pragma surface surf Lambert

        struct Input {
            float2 uv_MainTex;
        };
        sampler2D _MainTex;

        void surf(Input IN, inout SurfaceOutput o){
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
        }
        ENDCG
        
    }
    Fallback "Diffuse"
}
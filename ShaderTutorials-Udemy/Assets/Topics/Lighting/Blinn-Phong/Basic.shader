Shader "Holistic/Lighting/Basic"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SpecColor ("Spec Color", Color) = (1,1,1,1)   
        _Spec ("Specular", Range(0,1)) = 0.5     
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        // _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags{
            "Queue" = "Geometry"
        }
        
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf BlinnPhong

            // half _Metallic;
            float4 _Color;
            half _Spec;
            // float4 _SpecColor;
            fixed _Glossiness;

            struct Input
            {
                float2 uv_MainTex;
            };


            void surf (Input IN, inout SurfaceOutput o)
            {
                o.Albedo  = _Color.rgb;
                o.Specular = _Spec;
                o.Gloss = _Glossiness;
            }
        ENDCG
    }
    FallBack "Diffuse"
}

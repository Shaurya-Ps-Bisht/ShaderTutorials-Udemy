Shader "Holistic/Lighting/StandardPBR"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetallicTex ("Metallic (RGB)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _myEmission("Emission",Range(0,1)) = 0.0
        // _Glossiness ("Smoothness", Range(0,1)) = 0.5

    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
            #pragma surface surf Standard

            sampler2D _MetallicTex;
            // half _Glossiness;
            half _Metallic;
            fixed4 _Color;
            half _myEmission;

            struct Input
            {
                float2 uv_MetallicTex;
            };


            void surf (Input IN, inout SurfaceOutputStandard o)
            {
                o.Albedo = _Color.rgb;
                o.Smoothness = 0.9 -tex2D(_MetallicTex, IN.uv_MetallicTex).r;
                o.Metallic = _Metallic;                
                // o.Emission = 1 - saturate(tex2D (_MetallicTex, IN.uv_MetallicTex).r * _myEmission);
            }
        ENDCG
    }
    FallBack "Diffuse"
}

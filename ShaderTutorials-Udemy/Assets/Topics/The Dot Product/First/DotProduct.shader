Shader "Holistic/TheDotProduct/First"
{
    // Properties{
    //     _myDiffuse("Diffuse Texture", 2D) = "white"{}
    //     _myBump("Bump Texture", 2D) = "bump"{}
    //     _mySlider("Bump Amount", Range(0,10)) = 1
    //     _myScale("Texture Bump Scale", Range( 0.5, 10)) = 1
    //     _myCube ("Cube Map", CUBE) = "white"{}

    // }
    SubShader{
        CGPROGRAM   
            #pragma surface surf Lambert

            // sampler2D _myDiffuse;
            // sampler2D _myBump;
            // half _mySlider;
            // half _myScale;
            // samplerCUBE _myCube;

            struct Input{
                // float2 uv_myDiffuse;
                // float2 uv_myBump;
                float3 viewDir;
            };

            void surf (Input IN, inout SurfaceOutput o){
                half dotp = dot(IN.viewDir, o.Normal);
                o.Albedo.g = 1- dotp;
            }

        ENDCG
    }
    Fallback "Diffuse"
}
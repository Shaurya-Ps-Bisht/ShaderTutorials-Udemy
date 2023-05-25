Shader "Holistic/TheDotProduct/Rim"
{
    Properties{
        _RimColor("Rim Color", Color) = (1,1,1,1)
        _myDiffuse("Diffuse Texture", 2D) = "white"{}
        _RimPower ("Rim Power", Range(0.5,8.0)) = 3.0
    }
    SubShader{
        CGPROGRAM   
            #pragma surface surf Lambert

            sampler2D _myDiffuse;
            // sampler2D _myBump;
            // half _mySlider;
            // half _myScale;
            // samplerCUBE _myCube;
            float4 _RimColor;
            float _RimPower;

            struct Input{
                float2 uv_myDiffuse;
                // float2 uv_myBump;
                float3 viewDir;
                float3 worldPos;
            };

            void surf (Input IN, inout SurfaceOutput o){
                half dotp = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
                o.Albedo  = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
                // o.Emission = IN.worldPos.y > 1 ? float3(0,1,0):float3(1,0,0);

                o.Emission = frac(IN.worldPos.y*10 * 0.5) > 0.5 ? float3(0,1,0) * dotp:float3(1,0,0)* dotp;
            }

        ENDCG
    }
    Fallback "Diffuse"
}



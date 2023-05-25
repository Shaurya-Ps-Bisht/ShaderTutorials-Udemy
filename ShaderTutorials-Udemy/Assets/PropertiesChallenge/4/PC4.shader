Shader "Holistic/PropertiesChallenge/4"
{
    Properties
    {
        _myTex ("Example Texture", 2D) = "white"{}
        _myEmission("Emission Texture", 2D) = "white"{}
        
    }
    SubShader
    {
        
        CGPROGRAM
            #pragma surface surf Lambert

            
            sampler2D _myTex;
            sampler2D _myEmission;
            
            struct Input{
                float2 uv_myTex;
                float2 uv_myEmission;
            };

            void surf (Input IN, inout SurfaceOutput o){
                o.Albedo = (tex2D(_myTex, IN.uv_myTex)).rgb;
                o.Emission = (tex2D(_myEmission, IN.uv_myEmission)).rgb;
            }


        ENDCG
    }
    FallBack "Diffuse"
}

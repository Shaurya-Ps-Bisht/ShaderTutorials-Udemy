Shader "Holistic/HelloShader"{
    Properties{
        _myColor ("Example Color", Color) = (1,1,1,1)
        _myEmission ("Example Emission", Color) = (1,1,1,1)
        _myNormal("Example Normal", Color) = (1,1,1,1)
    }

    SubShader{
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input{
                float2 uvMainText;
            };

            fixed4 _myColor;
            fixed4 _myEmission;
            fixed4 _myNormal;

            void surf (Input IN, inout SurfaceOutput o){
                o.Emission  = _myEmission.rgb;
                o.Albedo = _myColor.rgb;
                o.Normal = _myNormal.rgb;
            }
        ENDCG

    }

    Fallback "Diffuse"
}

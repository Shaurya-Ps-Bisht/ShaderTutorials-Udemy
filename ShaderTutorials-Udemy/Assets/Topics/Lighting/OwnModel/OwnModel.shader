Shader "Holistic/Lighting/OwnModel"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)

    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
            #pragma surface surf BasicBlinn

            half4 LightingBasicBlinn (SurfaceOutput s, half3 lightDir, half3 viewDir, half atten){
                half3 h = normalize(lightDir + viewDir);

                half diff = max(0 , dot(s.Normal, lightDir));
                float nh = max(0, dot(s.Normal, h));
                float spec = pow(nh, 48.0);

                half4 c;
                c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec) * atten * _SinTime;
                c.a = s.Alpha;
                return c;
            }

            fixed4 _Color;

            struct Input
            {
                float2 uv_MetallicTex;
            };


            void surf (Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Color.rgb;
                // o.Emission = 1 - saturate(tex2D (_MetallicTex, IN.uv_MetallicTex).r * _myEmission);
            }
        ENDCG
    }
    FallBack "Diffuse"
}

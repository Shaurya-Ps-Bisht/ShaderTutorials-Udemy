Shader "Holistic/Advanced/51"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Amount("Extrude", Range(-1,1)) = 0.01
    }
    SubShader
    {
        

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        float _Amount;
        struct Input
        {
            float2 uv_MainTex;
        };

        struct MeshData{
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
        };

        void vert(inout MeshData v){
            v.vertex.xyz += v.normal * _Amount;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
        }
        ENDCG
    }
    FallBack "Diffuse"
}

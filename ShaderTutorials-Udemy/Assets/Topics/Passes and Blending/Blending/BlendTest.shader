Shader "Holistic/Passes&Blends/BlendTest"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }

        Blend One One

        Pass{
            SetTexture [_MainTex]{combine texture}
        }
    }
    FallBack "Diffuse"
}

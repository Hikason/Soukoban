// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/FadeOut"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _Center("Center", Vector) = (0,0,0,0)
        _Size("Size", Float) = 1
        _AnimTime("Animation Time", Range(0,1)) = 0
    }
    SubShader
    {
       ZTest Always
       Cull Off
       ZWrite Off
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 pos : SV_POSITION;
            };

            v2f vert (appdata_img v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord.xy);
                
                return o;
            }
            
            sampler2D _MainTex;
            float2 _Center;
            float _Size;
            float _AnimTime;

            fixed4 frag(v2f i) : SV_Target
            {
                float dis = distance(_Center, i.uv * _ScreenParams.xy);
                float visible = 1.0 - floor(dis / _Size + _AnimTime);

                return fixed4(tex2D(_MainTex, i.uv).rgb * visible, 1.0);
            }
            ENDCG
        }
    }
}

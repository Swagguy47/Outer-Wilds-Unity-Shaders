// Upgrade NOTE: upgraded instancing buffer 'OuterWildsFireAdditive' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Outer Wilds/Fire Additive"
{
	Properties
	{
		_Texture("Texture", 2D) = "white" {}
		_FadeMask("FadeMask", 2D) = "white" {}
		_TipColor("TipColor", Color) = (0.3960784,0.2,0.04705882,1)
		_Tint("Tint", Color) = (0.6792453,0.6211084,0.5991456,1)
		_EmissionStrength("EmissionStrength", Float) = 3
		_NoiseOffset("NoiseOffset", Float) = 1
		_MeshAccuracy("MeshAccuracy", Range( -10 , 100)) = 10
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "ForceNoShadowCasting" = "True" "IsEmissive" = "true"  }
		Cull Off
		Blend One One
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.6
		#pragma multi_compile_instancing
		#pragma surface surf Unlit keepalpha noshadow exclude_path:deferred novertexlights nolightmap  vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Texture;
		uniform sampler2D _FadeMask;

		UNITY_INSTANCING_BUFFER_START(OuterWildsFireAdditive)
			UNITY_DEFINE_INSTANCED_PROP(float4, _Texture_ST)
#define _Texture_ST_arr OuterWildsFireAdditive
			UNITY_DEFINE_INSTANCED_PROP(float4, _TipColor)
#define _TipColor_arr OuterWildsFireAdditive
			UNITY_DEFINE_INSTANCED_PROP(float4, _Tint)
#define _Tint_arr OuterWildsFireAdditive
			UNITY_DEFINE_INSTANCED_PROP(float4, _FadeMask_ST)
#define _FadeMask_ST_arr OuterWildsFireAdditive
			UNITY_DEFINE_INSTANCED_PROP(float, _NoiseOffset)
#define _NoiseOffset_arr OuterWildsFireAdditive
			UNITY_DEFINE_INSTANCED_PROP(float, _MeshAccuracy)
#define _MeshAccuracy_arr OuterWildsFireAdditive
			UNITY_DEFINE_INSTANCED_PROP(float, _EmissionStrength)
#define _EmissionStrength_arr OuterWildsFireAdditive
		UNITY_INSTANCING_BUFFER_END(OuterWildsFireAdditive)


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertexNormal = v.normal.xyz;
			float _NoiseOffset_Instance = UNITY_ACCESS_INSTANCED_PROP(_NoiseOffset_arr, _NoiseOffset);
			float2 panner2 = ( 1.0 * _Time.y * float2( 0,-2 ) + ( v.texcoord.xy * ( float2( 5,3 ) * _NoiseOffset_Instance ) ));
			float simplePerlin2D1 = snoise( panner2 );
			simplePerlin2D1 = simplePerlin2D1*0.5 + 0.5;
			float _MeshAccuracy_Instance = UNITY_ACCESS_INSTANCED_PROP(_MeshAccuracy_arr, _MeshAccuracy);
			float temp_output_14_0 = ( simplePerlin2D1 / _MeshAccuracy_Instance );
			v.vertex.xyz += ( ( ase_vertexNormal * float3(0.0025,0.0025,0.0025) * temp_output_14_0 ) + temp_output_14_0 );
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 _Texture_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Texture_ST_arr, _Texture_ST);
			float2 uv_Texture = i.uv_texcoord * _Texture_ST_Instance.xy + _Texture_ST_Instance.zw;
			float4 tex2DNode8 = tex2D( _Texture, uv_Texture );
			float4 _TipColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_TipColor_arr, _TipColor);
			float4 _Tint_Instance = UNITY_ACCESS_INSTANCED_PROP(_Tint_arr, _Tint);
			float _EmissionStrength_Instance = UNITY_ACCESS_INSTANCED_PROP(_EmissionStrength_arr, _EmissionStrength);
			float4 _FadeMask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_FadeMask_ST_arr, _FadeMask_ST);
			float2 uv_FadeMask = i.uv_texcoord * _FadeMask_ST_Instance.xy + _FadeMask_ST_Instance.zw;
			o.Emission = ( ( ( ( ( ( ( ( ( tex2DNode8 * tex2DNode8 * _TipColor_Instance ) * tex2DNode8 * 15.0 ) + tex2DNode8 ) * _Tint_Instance ) * _EmissionStrength_Instance ) * tex2DNode8.a ) / 3.0 ) * float4( 1,1,1,0 ) ) * ( tex2D( _FadeMask, uv_FadeMask ).a * 3.0 ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
0;343.6667;888;296;1323.498;-349.6143;1;True;False
Node;AmplifyShaderEditor.ColorNode;12;-1168.212,25.72413;Inherit;False;InstancedProperty;_TipColor;TipColor;2;0;Create;True;0;0;0;False;0;False;0.3960784,0.2,0.04705882,1;0,0.1702126,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;8;-1662.71,-179.7365;Inherit;True;Property;_Texture;Texture;0;0;Create;True;0;0;0;False;0;False;-1;None;6493d8c329cea324fadfaba366b0d09d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;17;-812.1165,-38.4949;Inherit;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-850.4302,-254.6332;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-637.4319,-199.681;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector2Node;6;-1718.469,455.6467;Inherit;False;Constant;_Offset;Offset;1;0;Create;True;0;0;0;False;0;False;5,3;5,3;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;48;-1646.256,583.6253;Inherit;False;InstancedProperty;_NoiseOffset;NoiseOffset;6;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-1459.256,461.6252;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;24;-554.3301,-43.62759;Inherit;False;InstancedProperty;_Tint;Tint;3;0;Create;True;0;0;0;False;0;False;0.6792453,0.6211084,0.5991456,1;0.6792453,0.6211084,0.5991455,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;21;-469.0338,-151.5565;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-1578.469,306.1468;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;4;-1225.469,470.1467;Inherit;False;Constant;_Vector0;Vector 0;0;0;Create;True;0;0;0;False;0;False;0,-2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-1301.469,349.6468;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-270.6798,-125.4283;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-313.0297,-0.4267468;Inherit;False;InstancedProperty;_EmissionStrength;EmissionStrength;5;0;Create;True;0;0;0;False;0;False;3;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;2;-1028.469,351.1468;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-124.3239,-120.679;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-976.0969,486.337;Inherit;False;InstancedProperty;_MeshAccuracy;MeshAccuracy;7;0;Create;True;0;0;0;False;0;False;10;10;-10;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1;-808.6094,353.6108;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-115.9601,144.8237;Inherit;False;Constant;_Float1;Float 1;6;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-131.7724,23.15218;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;56;21.08351,40.19895;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;26;-586.2789,270.654;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;28;-551.7313,530.7183;Inherit;False;Constant;_Vector3;Vector 3;3;0;Create;True;0;0;0;False;0;False;0.0025,0.0025,0.0025;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;65;-168.4694,207.5298;Inherit;True;Property;_FadeMask;FadeMask;1;0;Create;True;0;0;0;False;0;False;-1;None;44744e7d9edcd24429ea546250f6cf3e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;14;-545.0347,425.6432;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;187.0197,288.4537;Inherit;False;Constant;_Float2;Float 2;7;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-326.1716,334.4483;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;185.8893,67.08579;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;220.0197,178.4537;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;376.8728,52.03356;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-128.4355,407.8222;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;558.1087,-8.990722;Float;False;True;-1;6;ASEMaterialInspector;0;0;Unlit;Outer Wilds/Fire Additive;False;False;False;False;False;True;True;False;False;False;False;False;False;False;True;True;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;6;Custom;0.5;True;False;0;True;Transparent;;Transparent;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;1;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Spherical;False;Relative;0;;4;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;13;0;8;0
WireConnection;13;1;8;0
WireConnection;13;2;12;0
WireConnection;16;0;13;0
WireConnection;16;1;8;0
WireConnection;16;2;17;0
WireConnection;47;0;6;0
WireConnection;47;1;48;0
WireConnection;21;0;16;0
WireConnection;21;1;8;0
WireConnection;5;0;3;0
WireConnection;5;1;47;0
WireConnection;22;0;21;0
WireConnection;22;1;24;0
WireConnection;2;0;5;0
WireConnection;2;2;4;0
WireConnection;33;0;22;0
WireConnection;33;1;50;0
WireConnection;1;0;2;0
WireConnection;55;0;33;0
WireConnection;55;1;8;4
WireConnection;56;0;55;0
WireConnection;56;1;57;0
WireConnection;14;0;1;0
WireConnection;14;1;68;0
WireConnection;27;0;26;0
WireConnection;27;1;28;0
WireConnection;27;2;14;0
WireConnection;58;0;56;0
WireConnection;66;0;65;4
WireConnection;66;1;67;0
WireConnection;64;0;58;0
WireConnection;64;1;66;0
WireConnection;29;0;27;0
WireConnection;29;1;14;0
WireConnection;0;2;64;0
WireConnection;0;11;29;0
ASEEND*/
//CHKSM=7AD73E863EA1FABE4864B7069D249F7C24033641
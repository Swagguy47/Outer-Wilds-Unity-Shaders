// Upgrade NOTE: upgraded instancing buffer 'OuterWildsBlackHole' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Outer Wilds/Black Hole"
{
	Properties
	{
		_FrenselPower("FrenselPower", Float) = 0.7
		_CoreSize("Core Size", Range( 0 , 5)) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		GrabPass{ }
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf Unlit alpha:fade keepalpha noshadow 
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float4 screenPos;
		};

		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )

		UNITY_INSTANCING_BUFFER_START(OuterWildsBlackHole)
			UNITY_DEFINE_INSTANCED_PROP(float, _CoreSize)
#define _CoreSize_arr OuterWildsBlackHole
			UNITY_DEFINE_INSTANCED_PROP(float, _FrenselPower)
#define _FrenselPower_arr OuterWildsBlackHole
		UNITY_INSTANCING_BUFFER_END(OuterWildsBlackHole)

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float _CoreSize_Instance = UNITY_ACCESS_INSTANCED_PROP(_CoreSize_arr, _CoreSize);
			float fresnelNdotV40 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode40 = ( 0.0 + (50.0 + (_CoreSize_Instance - 5.0) * (100000.0 - 50.0) / (0.0 - 5.0)) * pow( 1.0 - fresnelNdotV40, 5.0 ) );
			float clampResult67 = clamp( fresnelNode40 , 0.0 , 1.0 );
			float _FrenselPower_Instance = UNITY_ACCESS_INSTANCED_PROP(_FrenselPower_arr, _FrenselPower);
			float fresnelNdotV31 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode31 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV31, _FrenselPower_Instance ) );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float4 screenColor38 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( ( pow( ( 1.0 - fresnelNode31 ) , 6.0 ) * (float4( 0,1,1,0 ) + (ase_screenPosNorm - float4( 1,0,0,0 )) * (float4( 1,0,0,0 ) - float4( 0,1,1,0 )) / (float4( 0,1,0,0 ) - float4( 1,0,0,0 ))) ) + ase_screenPosNorm ).xy);
			o.Emission = ( clampResult67 * screenColor38 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
0;369.6667;867;270;4000.468;661.2734;2.791779;True;False
Node;AmplifyShaderEditor.RangedFloatNode;32;-2764.939,140.2736;Inherit;False;InstancedProperty;_FrenselPower;FrenselPower;0;0;Create;True;0;0;0;False;0;False;0.7;0.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;31;-2508.212,33.72202;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;29;-2741.685,529.5367;Float;True;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;33;-2172.169,74.89806;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;34;-1989.77,90.89805;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;6;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;30;-2393.704,354.4946;Inherit;True;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;1,0,0,0;False;2;FLOAT4;0,1,0,0;False;3;FLOAT4;0,1,1,0;False;4;FLOAT4;1,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-2714.979,-281.8971;Inherit;False;InstancedProperty;_CoreSize;Core Size;1;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;44;-2429.475,-271.1149;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;5;False;2;FLOAT;0;False;3;FLOAT;50;False;4;FLOAT;100000;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-1815.263,337.5934;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FresnelNode;40;-2178.209,-329.1843;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;36;-1634.646,516.046;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;67;-1431.965,-90.16769;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;38;-1487.824,433.9534;Float;False;Global;_GrabScreen0;Grab Screen 0;2;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;-1113.878,160.7564;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-733.7841,80.3662;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;Outer Wilds/Black Hole;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;31;3;32;0
WireConnection;33;0;31;0
WireConnection;34;0;33;0
WireConnection;30;0;29;0
WireConnection;44;0;42;0
WireConnection;35;0;34;0
WireConnection;35;1;30;0
WireConnection;40;2;44;0
WireConnection;36;0;35;0
WireConnection;36;1;29;0
WireConnection;67;0;40;0
WireConnection;38;0;36;0
WireConnection;66;0;67;0
WireConnection;66;1;38;0
WireConnection;0;2;66;0
ASEEND*/
//CHKSM=1795AE0B67E3A6F0335837FA2AA3FA72707083E8
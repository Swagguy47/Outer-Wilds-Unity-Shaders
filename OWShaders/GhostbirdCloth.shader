// Upgrade NOTE: upgraded instancing buffer 'OuterWildsGhostbirdCloth' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Outer Wilds/Ghostbird Cloth"
{
	Properties
	{
		_Albedo("Albedo", 2D) = "white" {}
		_Skin("Skin", 2D) = "white" {}
		_Normal("Normal", 2D) = "bump" {}
		_NormalPower("NormalPower", Float) = 1
		_Metallic("Metallic", 2D) = "white" {}
		_Smoothness("Smoothness", Float) = 0
		_AO("AO", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Normal;
		uniform sampler2D _Skin;
		uniform sampler2D _Albedo;
		uniform sampler2D _Metallic;
		uniform sampler2D _AO;

		UNITY_INSTANCING_BUFFER_START(OuterWildsGhostbirdCloth)
			UNITY_DEFINE_INSTANCED_PROP(float4, _Normal_ST)
#define _Normal_ST_arr OuterWildsGhostbirdCloth
			UNITY_DEFINE_INSTANCED_PROP(float4, _Skin_ST)
#define _Skin_ST_arr OuterWildsGhostbirdCloth
			UNITY_DEFINE_INSTANCED_PROP(float4, _Albedo_ST)
#define _Albedo_ST_arr OuterWildsGhostbirdCloth
			UNITY_DEFINE_INSTANCED_PROP(float4, _Metallic_ST)
#define _Metallic_ST_arr OuterWildsGhostbirdCloth
			UNITY_DEFINE_INSTANCED_PROP(float4, _AO_ST)
#define _AO_ST_arr OuterWildsGhostbirdCloth
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalPower)
#define _NormalPower_arr OuterWildsGhostbirdCloth
			UNITY_DEFINE_INSTANCED_PROP(float, _Smoothness)
#define _Smoothness_arr OuterWildsGhostbirdCloth
		UNITY_INSTANCING_BUFFER_END(OuterWildsGhostbirdCloth)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _Normal_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Normal_ST_arr, _Normal_ST);
			float2 uv_Normal = i.uv_texcoord * _Normal_ST_Instance.xy + _Normal_ST_Instance.zw;
			float _NormalPower_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalPower_arr, _NormalPower);
			o.Normal = ( UnpackNormal( tex2D( _Normal, uv_Normal ) ) * _NormalPower_Instance );
			float4 _Skin_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Skin_ST_arr, _Skin_ST);
			float2 uv_Skin = i.uv_texcoord * _Skin_ST_Instance.xy + _Skin_ST_Instance.zw;
			float4 _Albedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Albedo_ST_arr, _Albedo_ST);
			float2 uv_Albedo = i.uv_texcoord * _Albedo_ST_Instance.xy + _Albedo_ST_Instance.zw;
			o.Albedo = ( tex2D( _Skin, uv_Skin ) * tex2D( _Albedo, uv_Albedo ) ).rgb;
			float4 _Metallic_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Metallic_ST_arr, _Metallic_ST);
			float2 uv_Metallic = i.uv_texcoord * _Metallic_ST_Instance.xy + _Metallic_ST_Instance.zw;
			o.Metallic = tex2D( _Metallic, uv_Metallic ).r;
			float _Smoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_Smoothness_arr, _Smoothness);
			o.Smoothness = _Smoothness_Instance;
			float4 _AO_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_AO_ST_arr, _AO_ST);
			float2 uv_AO = i.uv_texcoord * _AO_ST_Instance.xy + _AO_ST_Instance.zw;
			o.Occlusion = tex2D( _AO, uv_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
0;369.6667;867;270;995.864;98.86151;1.583568;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-330.5124,255.1161;Inherit;False;InstancedProperty;_NormalPower;NormalPower;3;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-667.8071,151.1185;Inherit;True;Property;_Normal;Normal;2;0;Create;True;0;0;0;False;0;False;-1;None;19513e2a86c74ae42b849f766ba17c98;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-441.1993,-47.39998;Inherit;True;Property;_Albedo;Albedo;0;0;Create;True;0;0;0;False;0;False;-1;None;19d619b3f4f66fb4084dba8ed68084a1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-458.0782,-251.03;Inherit;True;Property;_Skin;Skin;1;0;Create;True;0;0;0;False;0;False;-1;None;f14ee7a159f4d574095119d3af510a8d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-149.7122,157.516;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;7;-664.9281,358.0129;Inherit;True;Property;_Metallic;Metallic;4;0;Create;True;0;0;0;False;0;False;-1;None;92510d739fa86ae4199f772128978600;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;10;-664.8632,557.757;Inherit;True;Property;_AO;AO;6;0;Create;True;0;0;0;False;0;False;-1;None;7cabf919561e56f49bcf428374ea6d63;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-120.4374,-116.0972;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-328.0779,369.6667;Inherit;False;InstancedProperty;_Smoothness;Smoothness;5;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Outer Wilds/Ghostbird Cloth;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;2;0
WireConnection;5;1;6;0
WireConnection;15;0;13;0
WireConnection;15;1;1;0
WireConnection;0;0;15;0
WireConnection;0;1;5;0
WireConnection;0;3;7;0
WireConnection;0;4;9;0
WireConnection;0;5;10;0
ASEEND*/
//CHKSM=663B300C598F1888A70333B0D4FB157A7AF5D0D6
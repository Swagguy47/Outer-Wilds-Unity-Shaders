// Upgrade NOTE: upgraded instancing buffer 'OuterWildsTerrainVertexColor2x' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Outer Wilds/Terrain/Vertex Color 2x"
{
	Properties
	{
		_BaseColor("Base Color", Vector) = (1,1,1,0)
		_BaseAlbedo("Base Albedo", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_HeightSmoothness("Height Smoothness", Range( 0 , 1)) = 0
		_HeightOcclusion("Height Occlusion", Range( 0 , 1)) = 0
		_NormalScale("Normal Scale", Float) = 1
		[Normal]_BaseNormal("Base Normal", 2D) = "bump" {}
		_ColorR("Color (R)", Vector) = (1,1,1,0)
		_AlbedoR("Albedo (R)", 2D) = "white" {}
		_SmoothnessR("Smoothness (R)", Range( 0 , 1)) = 0
		_HeightSmoothnessR("Height Smoothness (R)", Range( 0 , 1)) = 0
		_HeightOcclusionR("Height Occlusion (R)", Range( 0 , 1)) = 0
		_NormalScaleR("Normal Scale (R)", Float) = 1
		[Normal]_NormalR("Normal (R)", 2D) = "bump" {}
		_DebugShowVertexColorRGBA("Debug (Show Vertex Color [R,G,B,A])", Vector) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _BaseNormal;
		uniform sampler2D _BaseAlbedo;
		uniform sampler2D _NormalR;
		uniform sampler2D _AlbedoR;

		UNITY_INSTANCING_BUFFER_START(OuterWildsTerrainVertexColor2x)
			UNITY_DEFINE_INSTANCED_PROP(float4, _BaseAlbedo_ST)
#define _BaseAlbedo_ST_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float4, _AlbedoR_ST)
#define _AlbedoR_ST_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float3, _BaseColor)
#define _BaseColor_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float3, _ColorR)
#define _ColorR_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float3, _DebugShowVertexColorRGBA)
#define _DebugShowVertexColorRGBA_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScale)
#define _NormalScale_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScaleR)
#define _NormalScaleR_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothness)
#define _HeightSmoothness_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _Smoothness)
#define _Smoothness_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothnessR)
#define _HeightSmoothnessR_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _SmoothnessR)
#define _SmoothnessR_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusion)
#define _HeightOcclusion_arr OuterWildsTerrainVertexColor2x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusionR)
#define _HeightOcclusionR_arr OuterWildsTerrainVertexColor2x
		UNITY_INSTANCING_BUFFER_END(OuterWildsTerrainVertexColor2x)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _BaseAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BaseAlbedo_ST_arr, _BaseAlbedo_ST);
			float2 uv_BaseAlbedo = i.uv_texcoord * _BaseAlbedo_ST_Instance.xy + _BaseAlbedo_ST_Instance.zw;
			float4 tex2DNode8 = tex2D( _BaseAlbedo, uv_BaseAlbedo );
			float _NormalScale_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScale_arr, _NormalScale);
			float3 clampResult149 = clamp( ( UnpackNormal( tex2D( _BaseNormal, tex2DNode8.rg ) ) * _NormalScale_Instance ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 BaseNormal46 = clampResult149;
			float4 _AlbedoR_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_AlbedoR_ST_arr, _AlbedoR_ST);
			float2 uv_AlbedoR = i.uv_texcoord * _AlbedoR_ST_Instance.xy + _AlbedoR_ST_Instance.zw;
			float4 tex2DNode52 = tex2D( _AlbedoR, uv_AlbedoR );
			float _NormalScaleR_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScaleR_arr, _NormalScaleR);
			float3 clampResult150 = clamp( ( ( UnpackNormal( tex2D( _NormalR, tex2DNode52.rg ) ) * _NormalScaleR_Instance ) * i.vertexColor.r ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 RedNormal66 = clampResult150;
			o.Normal = ( BaseNormal46 + RedNormal66 );
			float3 _BaseColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_BaseColor_arr, _BaseColor);
			float4 BaseAlbedo43 = ( ( float4( _BaseColor_Instance , 0.0 ) * tex2DNode8 ) * float4( 1,0,0,1 ) );
			float3 _ColorR_Instance = UNITY_ACCESS_INSTANCED_PROP(_ColorR_arr, _ColorR);
			float4 RedAlbedo68 = ( ( ( float4( _ColorR_Instance , 0.0 ) * tex2DNode52 ) * float4( 1,1,1,0 ) ) * i.vertexColor.r );
			float3 _DebugShowVertexColorRGBA_Instance = UNITY_ACCESS_INSTANCED_PROP(_DebugShowVertexColorRGBA_arr, _DebugShowVertexColorRGBA);
			o.Albedo = ( ( BaseAlbedo43 + RedAlbedo68 ) * float4( (float3( 1,1,1 ) + (_DebugShowVertexColorRGBA_Instance - float3( 0,0,0 )) * (float3( 0,0,0 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) , 0.0 ) ).rgb;
			o.Emission = ( i.vertexColor * float4( _DebugShowVertexColorRGBA_Instance , 0.0 ) ).rgb;
			float _HeightSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothness_arr, _HeightSmoothness);
			float _Smoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_Smoothness_arr, _Smoothness);
			float clampResult35 = clamp( ( ( tex2DNode8.a * _HeightSmoothness_Instance ) + _Smoothness_Instance ) , 0.0 , 1.0 );
			float BaseSmooth45 = clampResult35;
			float _HeightSmoothnessR_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothnessR_arr, _HeightSmoothnessR);
			float _SmoothnessR_Instance = UNITY_ACCESS_INSTANCED_PROP(_SmoothnessR_arr, _SmoothnessR);
			float clampResult65 = clamp( ( ( tex2DNode52.a * _HeightSmoothnessR_Instance ) + _SmoothnessR_Instance ) , 0.0 , 1.0 );
			float RedSmooth67 = ( clampResult65 * i.vertexColor.r );
			o.Smoothness = ( BaseSmooth45 + RedSmooth67 );
			float _HeightOcclusion_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusion_arr, _HeightOcclusion);
			float clampResult28 = clamp( tex2DNode8.a , (1.0 + (_HeightOcclusion_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float BaseAO153 = clampResult28;
			float _HeightOcclusionR_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusionR_arr, _HeightOcclusionR);
			float clampResult59 = clamp( tex2DNode52.a , (1.0 + (_HeightOcclusionR_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float RedAO155 = clampResult59;
			o.Occlusion = ( BaseAO153 + RedAO155 );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
0;369.6667;756;270;8674.459;2888.664;9.637583;True;False
Node;AmplifyShaderEditor.CommentaryNode;50;-2822.546,-1828.126;Inherit;False;1445.997;1075.026;Red;24;67;69;55;62;52;54;56;59;60;63;57;53;51;61;66;68;65;2;71;70;150;155;162;164;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;49;-4447.985,-1826.283;Inherit;False;1264.125;1044.201;Base;20;12;8;11;30;9;31;10;28;14;13;33;25;35;46;45;43;149;153;161;163;;1,0,0.906075,1;0;0
Node;AmplifyShaderEditor.Vector3Node;55;-2632.191,-1778.126;Inherit;False;InstancedProperty;_ColorR;Color (R);7;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;52;-2764.268,-1630.782;Inherit;True;Property;_AlbedoR;Albedo (R);8;0;Create;True;0;0;0;False;0;False;-1;None;903bd88a7dd4ecc41bbc57b3ea1716e7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;53;-2764.268,-1342.78;Inherit;False;InstancedProperty;_HeightSmoothnessR;Height Smoothness (R);10;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-2268.267,-1614.782;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;60;-2772.546,-1013.924;Inherit;True;Property;_NormalR;Normal (R);13;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;8413fb4b78b2653439671f1ffe6e6763;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;8;-4389.707,-1628.939;Inherit;True;Property;_BaseAlbedo;Base Albedo;1;0;Create;True;0;0;0;False;0;False;-1;None;5ae2dfe495e6cfc4f804162633f9cadb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-4389.707,-1340.937;Inherit;False;InstancedProperty;_HeightSmoothness;Height Smoothness;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;164;-2437.976,-1746.578;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-2764.268,-1422.781;Inherit;False;InstancedProperty;_SmoothnessR;Smoothness (R);9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;9;-4257.631,-1776.283;Inherit;False;InstancedProperty;_BaseColor;Base Color;0;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;61;-2668.267,-1102.778;Inherit;False;InstancedProperty;_NormalScaleR;Normal Scale (R);12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;162;-2435.717,-1021.536;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-4293.708,-1100.936;Inherit;False;InstancedProperty;_NormalScale;Normal Scale;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-4389.707,-1420.938;Inherit;False;InstancedProperty;_Smoothness;Smoothness;2;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-3893.707,-1612.939;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;2;-1976.425,-1225.328;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-2268.267,-1518.782;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;14;-4397.985,-1012.082;Inherit;True;Property;_BaseNormal;Base Normal;6;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;c3945708faa777948b242403914ac955;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-4395.861,-1182.043;Inherit;False;InstancedProperty;_HeightOcclusion;Height Occlusion;4;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-2770.422,-1183.886;Inherit;False;InstancedProperty;_HeightOcclusionR;Height Occlusion (R);11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;163;-4048.439,-1747.115;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;62;-2108.267,-1502.782;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;65;-1920.663,-1502.468;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;161;-4072.254,-1011.826;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;54;-2469.978,-1278.78;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-2262.109,-1020.733;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-3893.707,-1516.939;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,0,0,1;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;30;-4095.418,-1276.937;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-3733.707,-1500.939;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;-2095.49,-1381.388;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;28;-3895.85,-1400.359;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;35;-3546.104,-1500.625;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;87;-1082.012,-209.005;Inherit;False;521.8525;509.4758;Debug Functionality;3;83;85;138;;1,0.5615011,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;68;-1914.161,-1371.671;Inherit;False;RedAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;43;-3729.42,-1399.356;Inherit;False;BaseAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;150;-2092.754,-1024.634;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;149;-3876.798,-1011.243;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-1690.897,-1500.97;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;59;-2270.41,-1402.202;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-421.9899,-161.9644;Inherit;False;68;RedAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;46;-3712.593,-1026.412;Inherit;False;BaseNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;153;-3724.888,-1283.538;Inherit;False;BaseAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-1908.486,-1026.425;Inherit;False;RedNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;45;-3407.86,-1494.87;Inherit;False;BaseSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;-1561.055,-1504.829;Inherit;False;RedSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;138;-1074.023,-10.70875;Inherit;False;InstancedProperty;_DebugShowVertexColorRGBA;Debug (Show Vertex Color [R,G,B,A]);14;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;155;-2197.329,-1263.148;Inherit;False;RedAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-423.2262,-226.3464;Inherit;False;43;BaseAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;157;-438.6883,773.7465;Inherit;False;155;RedAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;-426.6783,132.7288;Inherit;False;66;RedNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-449.8866,342.3573;Inherit;False;45;BaseSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-442.4617,417.5486;Inherit;False;67;RedSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;83;-751.1597,-159.005;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;159;-446.1132,698.5552;Inherit;False;153;BaseAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;75;-192.2606,-154.432;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;85;-769.1279,92.33752;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;1,1,1;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;47;-428.7677,64.9261;Inherit;False;46;BaseNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;77;-216.8501,367.2046;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;-64.99943,-158.7968;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-210.7101,-10.66124;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;76;-215.0794,85.81801;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;160;-213.0767,723.4025;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;95.24322,2.38108;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Outer Wilds/Terrain/Vertex Color 2x;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;56;0;52;4
WireConnection;56;1;53;0
WireConnection;60;1;52;0
WireConnection;164;0;55;0
WireConnection;164;1;52;0
WireConnection;162;0;60;0
WireConnection;162;1;61;0
WireConnection;31;0;8;4
WireConnection;31;1;11;0
WireConnection;63;0;164;0
WireConnection;14;1;8;0
WireConnection;163;0;9;0
WireConnection;163;1;8;0
WireConnection;62;0;56;0
WireConnection;62;1;57;0
WireConnection;65;0;62;0
WireConnection;161;0;14;0
WireConnection;161;1;13;0
WireConnection;54;0;51;0
WireConnection;71;0;162;0
WireConnection;71;1;2;1
WireConnection;25;0;163;0
WireConnection;30;0;12;0
WireConnection;33;0;31;0
WireConnection;33;1;10;0
WireConnection;70;0;63;0
WireConnection;70;1;2;1
WireConnection;28;0;8;4
WireConnection;28;1;30;0
WireConnection;35;0;33;0
WireConnection;68;0;70;0
WireConnection;43;0;25;0
WireConnection;150;0;71;0
WireConnection;149;0;161;0
WireConnection;69;0;65;0
WireConnection;69;1;2;1
WireConnection;59;0;52;4
WireConnection;59;1;54;0
WireConnection;46;0;149;0
WireConnection;153;0;28;0
WireConnection;66;0;150;0
WireConnection;45;0;35;0
WireConnection;67;0;69;0
WireConnection;155;0;59;0
WireConnection;75;0;44;0
WireConnection;75;1;72;0
WireConnection;85;0;138;0
WireConnection;77;0;48;0
WireConnection;77;1;74;0
WireConnection;86;0;75;0
WireConnection;86;1;85;0
WireConnection;81;0;83;0
WireConnection;81;1;138;0
WireConnection;76;0;47;0
WireConnection;76;1;73;0
WireConnection;160;0;159;0
WireConnection;160;1;157;0
WireConnection;0;0;86;0
WireConnection;0;1;76;0
WireConnection;0;2;81;0
WireConnection;0;4;77;0
WireConnection;0;5;160;0
ASEEND*/
//CHKSM=23937E7836489E4BDEA1998247FF9FCF2B738F25
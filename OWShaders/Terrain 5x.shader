// Upgrade NOTE: upgraded instancing buffer 'OuterWildsTerrainVertexColor5x' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Outer Wilds/Terrain/Vertex Color 5x"
{
	Properties
	{
		_BaseColor("Base Color", Vector) = (0,0,0,0)
		_BaseAlbedo("Base Albedo", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_HeightSmoothness("Height Smoothness", Range( 0 , 1)) = 0
		_HeightOcclusion("Height Occlusion", Range( 0 , 1)) = 0
		_NormalScale("Normal Scale", Float) = 1
		[Normal]_BaseNormal("Base Normal", 2D) = "bump" {}
		_ColorR("Color (R)", Vector) = (0,0,0,0)
		_AlbedoR("Albedo (R)", 2D) = "white" {}
		_SmoothnessR("Smoothness (R)", Range( 0 , 1)) = 0
		_HeightSmoothnessR("Height Smoothness (R)", Range( 0 , 1)) = 0
		_HeightOcclusionR("Height Occlusion (R)", Range( 0 , 1)) = 0
		_NormalScaleR("Normal Scale (R)", Float) = 1
		[Normal]_NormalR("Normal (R)", 2D) = "bump" {}
		_ColorG("Color (G)", Vector) = (0,0,0,0)
		_AlbedoG("Albedo (G)", 2D) = "white" {}
		_SmoothnessG("Smoothness (G)", Range( 0 , 1)) = 0
		_HeightSmoothnessG("Height Smoothness (G)", Range( 0 , 1)) = 0
		_HeightOcclusionG("Height Occlusion (G)", Range( 0 , 1)) = 0
		_NormalScaleG("Normal Scale (G)", Float) = 1
		[Normal]_NormalG("Normal (G)", 2D) = "bump" {}
		_ColorB("Color (B)", Vector) = (0,0,0,0)
		_AlbedoB("Albedo (B)", 2D) = "white" {}
		_SmoothnessB("Smoothness (B)", Range( 0 , 1)) = 0
		_HeightSmoothnessB("Height Smoothness (B)", Range( 0 , 1)) = 0
		_HeightOcclusionB("Height Occlusion (B)", Range( 0 , 1)) = 0
		_NormalScaleB("Normal Scale (B)", Float) = 1
		[Normal]_NormalB("Normal (B)", 2D) = "bump" {}
		_ColorA("Color (A)", Vector) = (0,0,0,0)
		_AlbedoA("Albedo (A)", 2D) = "white" {}
		_SmoothnessA("Smoothness (A)", Range( 0 , 1)) = 0
		_HeightSmoothnessA("Height Smoothness (A)", Range( 0 , 1)) = 0
		_HeightOcclusionA("Height Occlusion (A)", Range( 0 , 1)) = 0
		_NormalScaleA("Normal Scale (A)", Float) = 1
		[Normal]_NormalA("Normal (A)", 2D) = "bump" {}
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
		uniform sampler2D _NormalG;
		uniform sampler2D _AlbedoG;
		uniform sampler2D _NormalB;
		uniform sampler2D _AlbedoB;
		uniform sampler2D _NormalA;
		uniform sampler2D _AlbedoA;

		UNITY_INSTANCING_BUFFER_START(OuterWildsTerrainVertexColor5x)
			UNITY_DEFINE_INSTANCED_PROP(float4, _BaseAlbedo_ST)
#define _BaseAlbedo_ST_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float4, _AlbedoR_ST)
#define _AlbedoR_ST_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float4, _AlbedoG_ST)
#define _AlbedoG_ST_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float4, _AlbedoB_ST)
#define _AlbedoB_ST_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float4, _AlbedoA_ST)
#define _AlbedoA_ST_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float3, _ColorA)
#define _ColorA_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float3, _ColorB)
#define _ColorB_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float3, _ColorG)
#define _ColorG_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float3, _ColorR)
#define _ColorR_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float3, _BaseColor)
#define _BaseColor_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float3, _DebugShowVertexColorRGBA)
#define _DebugShowVertexColorRGBA_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScaleB)
#define _NormalScaleB_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusionR)
#define _HeightOcclusionR_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusionG)
#define _HeightOcclusionG_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusion)
#define _HeightOcclusion_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _SmoothnessA)
#define _SmoothnessA_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothnessA)
#define _HeightSmoothnessA_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _SmoothnessB)
#define _SmoothnessB_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothnessB)
#define _HeightSmoothnessB_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _SmoothnessG)
#define _SmoothnessG_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothnessG)
#define _HeightSmoothnessG_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _SmoothnessR)
#define _SmoothnessR_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothnessR)
#define _HeightSmoothnessR_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _Smoothness)
#define _Smoothness_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightSmoothness)
#define _HeightSmoothness_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusionB)
#define _HeightOcclusionB_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScale)
#define _NormalScale_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScaleR)
#define _NormalScaleR_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScaleG)
#define _NormalScaleG_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _NormalScaleA)
#define _NormalScaleA_arr OuterWildsTerrainVertexColor5x
			UNITY_DEFINE_INSTANCED_PROP(float, _HeightOcclusionA)
#define _HeightOcclusionA_arr OuterWildsTerrainVertexColor5x
		UNITY_INSTANCING_BUFFER_END(OuterWildsTerrainVertexColor5x)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _BaseAlbedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BaseAlbedo_ST_arr, _BaseAlbedo_ST);
			float2 uv_BaseAlbedo = i.uv_texcoord * _BaseAlbedo_ST_Instance.xy + _BaseAlbedo_ST_Instance.zw;
			float4 tex2DNode8 = tex2D( _BaseAlbedo, uv_BaseAlbedo );
			float _NormalScale_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScale_arr, _NormalScale);
			float3 temp_cast_1 = (_NormalScale_Instance).xxx;
			float3 clampResult149 = clamp( pow( UnpackNormal( tex2D( _BaseNormal, tex2DNode8.rg ) ) , temp_cast_1 ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 BaseNormal46 = clampResult149;
			float4 _AlbedoR_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_AlbedoR_ST_arr, _AlbedoR_ST);
			float2 uv_AlbedoR = i.uv_texcoord * _AlbedoR_ST_Instance.xy + _AlbedoR_ST_Instance.zw;
			float4 tex2DNode52 = tex2D( _AlbedoR, uv_AlbedoR );
			float _NormalScaleR_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScaleR_arr, _NormalScaleR);
			float3 temp_cast_3 = (_NormalScaleR_Instance).xxx;
			float3 clampResult150 = clamp( ( pow( UnpackNormal( tex2D( _NormalR, tex2DNode52.rg ) ) , temp_cast_3 ) * i.vertexColor.r ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 RedNormal66 = clampResult150;
			float4 _AlbedoG_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_AlbedoG_ST_arr, _AlbedoG_ST);
			float2 uv_AlbedoG = i.uv_texcoord * _AlbedoG_ST_Instance.xy + _AlbedoG_ST_Instance.zw;
			float4 tex2DNode113 = tex2D( _AlbedoG, uv_AlbedoG );
			float _NormalScaleG_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScaleG_arr, _NormalScaleG);
			float3 temp_cast_5 = (_NormalScaleG_Instance).xxx;
			float3 clampResult151 = clamp( ( pow( UnpackNormal( tex2D( _NormalG, tex2DNode113.rg ) ) , temp_cast_5 ) * i.vertexColor.g ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 GreenNormal132 = clampResult151;
			float4 _AlbedoB_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_AlbedoB_ST_arr, _AlbedoB_ST);
			float2 uv_AlbedoB = i.uv_texcoord * _AlbedoB_ST_Instance.xy + _AlbedoB_ST_Instance.zw;
			float4 tex2DNode166 = tex2D( _AlbedoB, uv_AlbedoB );
			float _NormalScaleB_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScaleB_arr, _NormalScaleB);
			float3 temp_cast_7 = (_NormalScaleB_Instance).xxx;
			float3 clampResult182 = clamp( ( pow( UnpackNormal( tex2D( _NormalB, tex2DNode166.rg ) ) , temp_cast_7 ) * i.vertexColor.b ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 BlueNormal184 = clampResult182;
			float4 _AlbedoA_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_AlbedoA_ST_arr, _AlbedoA_ST);
			float2 uv_AlbedoA = i.uv_texcoord * _AlbedoA_ST_Instance.xy + _AlbedoA_ST_Instance.zw;
			float4 tex2DNode192 = tex2D( _AlbedoA, uv_AlbedoA );
			float _NormalScaleA_Instance = UNITY_ACCESS_INSTANCED_PROP(_NormalScaleA_arr, _NormalScaleA);
			float3 temp_cast_9 = (_NormalScaleA_Instance).xxx;
			float3 clampResult210 = clamp( ( pow( UnpackNormal( tex2D( _NormalA, tex2DNode192.rg ) ) , temp_cast_9 ) * i.vertexColor.a ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 AlphaNormal212 = clampResult210;
			o.Normal = ( BaseNormal46 + RedNormal66 + GreenNormal132 + BlueNormal184 + AlphaNormal212 );
			float3 _BaseColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_BaseColor_arr, _BaseColor);
			float4 BaseAlbedo43 = ( ( float4( _BaseColor_Instance , 0.0 ) + tex2DNode8 ) * float4( 1,1,1,1 ) );
			float3 _ColorR_Instance = UNITY_ACCESS_INSTANCED_PROP(_ColorR_arr, _ColorR);
			float4 RedAlbedo68 = ( ( ( float4( _ColorR_Instance , 0.0 ) + tex2DNode52 ) * float4( 1,1,1,1 ) ) * i.vertexColor.r );
			float3 _ColorG_Instance = UNITY_ACCESS_INSTANCED_PROP(_ColorG_arr, _ColorG);
			float4 GreenAlbedo130 = ( ( ( float4( _ColorG_Instance , 0.0 ) + tex2DNode113 ) * float4( 1,1,1,1 ) ) * i.vertexColor.g );
			float3 _ColorB_Instance = UNITY_ACCESS_INSTANCED_PROP(_ColorB_arr, _ColorB);
			float4 BlueAlbedo180 = ( ( ( float4( _ColorB_Instance , 0.0 ) + tex2DNode166 ) * float4( 1,1,1,1 ) ) * i.vertexColor.b );
			float3 _ColorA_Instance = UNITY_ACCESS_INSTANCED_PROP(_ColorA_arr, _ColorA);
			float4 AlphaAlbedo209 = ( ( ( float4( _ColorA_Instance , 0.0 ) + tex2DNode192 ) * float4( 1,1,1,1 ) ) * i.vertexColor.a );
			float3 _DebugShowVertexColorRGBA_Instance = UNITY_ACCESS_INSTANCED_PROP(_DebugShowVertexColorRGBA_arr, _DebugShowVertexColorRGBA);
			o.Albedo = ( ( BaseAlbedo43 + RedAlbedo68 + GreenAlbedo130 + BlueAlbedo180 + AlphaAlbedo209 ) * float4( (float3( 1,1,1 ) + (_DebugShowVertexColorRGBA_Instance - float3( 0,0,0 )) * (float3( 0,0,0 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) , 0.0 ) ).rgb;
			o.Emission = ( i.vertexColor * float4( _DebugShowVertexColorRGBA_Instance , 0.0 ) ).rgb;
			float _HeightSmoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothness_arr, _HeightSmoothness);
			float _Smoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_Smoothness_arr, _Smoothness);
			float clampResult35 = clamp( ( ( tex2DNode8.a * _HeightSmoothness_Instance ) + _Smoothness_Instance ) , 0.0 , 1.0 );
			float BaseSmooth45 = clampResult35;
			float _HeightSmoothnessR_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothnessR_arr, _HeightSmoothnessR);
			float _SmoothnessR_Instance = UNITY_ACCESS_INSTANCED_PROP(_SmoothnessR_arr, _SmoothnessR);
			float clampResult65 = clamp( ( ( tex2DNode52.a * _HeightSmoothnessR_Instance ) + _SmoothnessR_Instance ) , 0.0 , 1.0 );
			float RedSmooth67 = ( clampResult65 * i.vertexColor.r );
			float _HeightSmoothnessG_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothnessG_arr, _HeightSmoothnessG);
			float _SmoothnessG_Instance = UNITY_ACCESS_INSTANCED_PROP(_SmoothnessG_arr, _SmoothnessG);
			float clampResult127 = clamp( ( ( tex2DNode113.a * _HeightSmoothnessG_Instance ) + _SmoothnessG_Instance ) , 0.0 , 1.0 );
			float GreenSmooth133 = ( clampResult127 * i.vertexColor.g );
			float _HeightSmoothnessB_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothnessB_arr, _HeightSmoothnessB);
			float _SmoothnessB_Instance = UNITY_ACCESS_INSTANCED_PROP(_SmoothnessB_arr, _SmoothnessB);
			float clampResult178 = clamp( ( ( tex2DNode166.a * _HeightSmoothnessB_Instance ) + _SmoothnessB_Instance ) , 0.0 , 1.0 );
			float BlueSmooth183 = ( clampResult178 * i.vertexColor.b );
			float _HeightSmoothnessA_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightSmoothnessA_arr, _HeightSmoothnessA);
			float _SmoothnessA_Instance = UNITY_ACCESS_INSTANCED_PROP(_SmoothnessA_arr, _SmoothnessA);
			float clampResult208 = clamp( ( ( tex2DNode192.a * _HeightSmoothnessA_Instance ) + _SmoothnessA_Instance ) , 0.0 , 1.0 );
			float AlphaSmooth214 = ( clampResult208 * i.vertexColor.a );
			o.Smoothness = ( BaseSmooth45 + RedSmooth67 + GreenSmooth133 + BlueSmooth183 + AlphaSmooth214 );
			float _HeightOcclusion_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusion_arr, _HeightOcclusion);
			float clampResult28 = clamp( tex2DNode8.a , (1.0 + (_HeightOcclusion_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float BaseAO153 = clampResult28;
			float _HeightOcclusionG_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusionG_arr, _HeightOcclusionG);
			float clampResult117 = clamp( tex2DNode113.a , (1.0 + (_HeightOcclusionG_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float GreenAO156 = clampResult117;
			float _HeightOcclusionR_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusionR_arr, _HeightOcclusionR);
			float clampResult59 = clamp( tex2DNode52.a , (1.0 + (_HeightOcclusionR_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float RedAO155 = clampResult59;
			float _HeightOcclusionB_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusionB_arr, _HeightOcclusionB);
			float clampResult169 = clamp( tex2DNode166.a , (1.0 + (_HeightOcclusionB_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float BlueAO185 = clampResult169;
			float _HeightOcclusionA_Instance = UNITY_ACCESS_INSTANCED_PROP(_HeightOcclusionA_arr, _HeightOcclusionA);
			float clampResult197 = clamp( tex2DNode192.a , (1.0 + (_HeightOcclusionA_Instance - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , 1.0 );
			float AlphaAO213 = clampResult197;
			o.Occlusion = ( BaseAO153 + GreenAO156 + RedAO155 + BlueAO185 + AlphaAO213 );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
0;369.6667;947;270;-2265.036;1601.081;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;50;-2822.546,-1828.126;Inherit;False;1445.997;1075.026;Red;24;67;69;55;62;52;54;56;59;60;58;63;64;57;53;51;61;66;68;65;2;71;70;150;155;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;161;665.0276,-1833.494;Inherit;False;1445.997;1075.026;Blue;24;185;184;183;182;181;180;179;178;177;176;175;174;173;172;171;170;169;168;167;166;165;164;163;162;;0,0.01004601,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;111;-1091.974,-1826.505;Inherit;False;1445.997;1075.026;Green;24;133;132;131;130;129;128;127;126;125;124;123;122;121;120;119;118;117;116;115;114;113;112;151;156;;0.06150281,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;190;2417.701,-1835.793;Inherit;False;1445.997;1075.026;Alpha;24;214;213;212;211;210;209;208;207;206;205;204;203;202;201;200;199;198;197;196;195;194;193;192;191;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector3Node;164;855.3813,-1783.494;Inherit;False;InstancedProperty;_ColorB;Color (B);21;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;195;2475.979,-1350.446;Inherit;False;InstancedProperty;_HeightSmoothnessA;Height Smoothness (A);31;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;49;-4447.985,-1826.283;Inherit;False;1264.125;1044.201;Base;20;12;8;11;30;9;31;10;37;28;14;13;33;25;39;35;46;45;43;149;153;;1,0,0.906075,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-2764.268,-1342.78;Inherit;False;InstancedProperty;_HeightSmoothnessR;Height Smoothness (R);10;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;166;723.3054,-1636.15;Inherit;True;Property;_AlbedoB;Albedo (B);22;0;Create;True;0;0;0;False;0;False;-1;None;94b8d472780ed7548ac458dfeac9f70a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;55;-2632.191,-1778.126;Inherit;False;InstancedProperty;_ColorR;Color (R);7;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;192;2475.979,-1638.449;Inherit;True;Property;_AlbedoA;Albedo (A);29;0;Create;True;0;0;0;False;0;False;-1;None;94b8d472780ed7548ac458dfeac9f70a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;113;-1033.696,-1629.161;Inherit;True;Property;_AlbedoG;Albedo (G);15;0;Create;True;0;0;0;False;0;False;-1;None;94b8d472780ed7548ac458dfeac9f70a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;115;-901.6202,-1776.505;Inherit;False;InstancedProperty;_ColorG;Color (G);14;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;114;-1033.696,-1341.159;Inherit;False;InstancedProperty;_HeightSmoothnessG;Height Smoothness (G);17;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;52;-2764.268,-1630.782;Inherit;True;Property;_AlbedoR;Albedo (R);8;0;Create;True;0;0;0;False;0;False;-1;None;903bd88a7dd4ecc41bbc57b3ea1716e7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;163;723.3054,-1348.148;Inherit;False;InstancedProperty;_HeightSmoothnessB;Height Smoothness (B);24;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;193;2608.055,-1785.792;Inherit;False;InstancedProperty;_ColorA;Color (A);28;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;168;723.3054,-1428.149;Inherit;False;InstancedProperty;_SmoothnessB;Smoothness (B);23;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;8;-4389.707,-1628.939;Inherit;True;Property;_BaseAlbedo;Base Albedo;1;0;Create;True;0;0;0;False;0;False;-1;None;5ae2dfe495e6cfc4f804162633f9cadb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;167;1219.305,-1620.15;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;170;718.0281,-1019.292;Inherit;True;Property;_NormalB;Normal (B);27;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;7ff2873503107574288b3da750c2db26;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-2268.267,-1614.782;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-2764.268,-1422.781;Inherit;False;InstancedProperty;_SmoothnessR;Smoothness (R);9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-537.6962,-1613.161;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-2668.267,-1102.778;Inherit;False;InstancedProperty;_NormalScaleR;Normal Scale (R);12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;172;819.3054,-1108.146;Inherit;False;InstancedProperty;_NormalScaleB;Normal Scale (B);26;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;200;2971.979,-1622.448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;58;-2426.767,-1709.916;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;9;-4257.631,-1776.283;Inherit;False;InstancedProperty;_BaseColor;Base Color;0;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;199;2571.979,-1110.444;Inherit;False;InstancedProperty;_NormalScaleA;Normal Scale (A);33;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-937.6961,-1101.157;Inherit;False;InstancedProperty;_NormalScaleG;Normal Scale (G);19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;118;-1033.696,-1421.16;Inherit;False;InstancedProperty;_SmoothnessG;Smoothness (G);16;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;198;2470.702,-1021.59;Inherit;True;Property;_NormalA;Normal (A);34;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;7ff2873503107574288b3da750c2db26;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;171;1060.805,-1715.284;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;196;2813.479,-1717.582;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;119;-696.1962,-1708.295;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-4389.707,-1340.937;Inherit;False;InstancedProperty;_HeightSmoothness;Height Smoothness;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;122;-1041.974,-1012.303;Inherit;True;Property;_NormalG;Normal (G);20;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;7ff2873503107574288b3da750c2db26;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;201;2475.979,-1430.447;Inherit;False;InstancedProperty;_SmoothnessA;Smoothness (A);30;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;60;-2772.546,-1013.924;Inherit;True;Property;_NormalR;Normal (R);13;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;8413fb4b78b2653439671f1ffe6e6763;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;123;-377.6959,-1501.161;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-1039.85,-1182.265;Inherit;False;InstancedProperty;_HeightOcclusionG;Height Occlusion (G);18;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;125;-245.853,-1223.707;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;2;-1976.425,-1225.328;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;162;717.1515,-1189.254;Inherit;False;InstancedProperty;_HeightOcclusionB;Height Occlusion (B);25;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;191;2469.825,-1191.552;Inherit;False;InstancedProperty;_HeightOcclusionA;Height Occlusion (A);32;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-2770.422,-1183.886;Inherit;False;InstancedProperty;_HeightOcclusionR;Height Occlusion (R);11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;62;-2108.267,-1502.782;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-4395.861,-1182.043;Inherit;False;InstancedProperty;_HeightOcclusion;Height Occlusion;4;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;14;-4397.985,-1012.082;Inherit;True;Property;_BaseNormal;Base Normal;6;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;c3945708faa777948b242403914ac955;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-3893.707,-1612.939;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;174;1379.305,-1508.15;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;2971.979,-1526.448;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;126;-713.6962,-1021.157;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;64;-2436.439,-1022.778;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-2268.267,-1518.782;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;1219.305,-1524.15;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;124;-537.6962,-1517.161;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-4389.707,-1420.938;Inherit;False;InstancedProperty;_Smoothness;Smoothness;2;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;176;1043.305,-1028.146;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-4293.708,-1100.936;Inherit;False;InstancedProperty;_NormalScale;Normal Scale;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;202;3263.822,-1232.994;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;204;3131.979,-1510.448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;175;1511.148,-1230.696;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;205;2795.979,-1030.444;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-4052.207,-1708.073;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;116;-739.4075,-1277.159;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;30;-4095.418,-1276.937;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;194;2770.268,-1286.446;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;179;1225.463,-1026.1;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;-531.5383,-1019.111;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;165;1017.594,-1284.148;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;177;1392.083,-1386.756;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;54;-2469.978,-1278.78;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;208;3319.585,-1510.134;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;178;1566.911,-1507.836;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;-364.9188,-1379.767;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-3733.707,-1500.939;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;65;-1920.663,-1502.468;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;127;-190.0908,-1500.847;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;206;2978.137,-1028.398;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;207;3144.757,-1389.054;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-2262.109,-1020.733;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;-2095.49,-1381.388;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-3893.707,-1516.939;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;39;-4069.707,-1020.936;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;87;-1082.012,-209.005;Inherit;False;521.8525;509.4758;Debug Functionality;3;83;85;138;;1,0.5615011,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;130;-183.5888,-1370.049;Inherit;False;GreenAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;1796.676,-1506.338;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;180;1573.412,-1377.038;Inherit;False;BlueAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;149;-3876.798,-1011.243;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;35;-3546.104,-1500.625;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;3549.35,-1508.636;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;210;3131.853,-1026.449;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;169;1217.162,-1407.569;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;68;-1914.161,-1371.671;Inherit;False;RedAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;151;-377.822,-1017.162;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;182;1379.179,-1024.151;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-1690.897,-1500.97;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;197;2969.836,-1409.867;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;209;3326.086,-1379.336;Inherit;False;AlphaAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;117;-539.8393,-1400.58;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;43;-3729.42,-1399.356;Inherit;False;BaseAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;59;-2270.41,-1402.202;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;131;39.67529,-1499.349;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;28;-3895.85,-1400.359;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;150;-2092.754,-1024.634;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;135;-426.1886,-244.2662;Inherit;False;130;GreenAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;212;3289.957,-1030.736;Inherit;False;AlphaNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;185;1301.261,-1241.842;Inherit;False;BlueAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;215;-430.1886,-89.67648;Inherit;False;209;AlphaAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;132;-219.7185,-1021.449;Inherit;False;GreenNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;45;-3407.86,-1494.87;Inherit;False;BaseSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-428.7998,-320.5608;Inherit;False;68;RedAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;155;-2197.329,-1263.148;Inherit;False;RedAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;156;-455.7405,-1234.853;Inherit;False;GreenAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;214;3679.194,-1512.495;Inherit;False;AlphaSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;169.5175,-1503.208;Inherit;False;GreenSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-430.0361,-384.9427;Inherit;False;43;BaseAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;186;-425.776,-165.8485;Inherit;False;180;BlueAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;138;-1074.023,-10.70875;Inherit;False;InstancedProperty;_DebugShowVertexColorRGBA;Debug (Show Vertex Color [R,G,B,A]);35;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;184;1537.283,-1028.438;Inherit;False;BlueNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;153;-3724.888,-1283.538;Inherit;False;BaseAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;46;-3712.593,-1026.412;Inherit;False;BaseNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;1926.52,-1510.197;Inherit;False;BlueSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-1908.486,-1026.425;Inherit;False;RedNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;-1561.055,-1504.829;Inherit;False;RedSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;213;3053.935,-1244.14;Inherit;False;AlphaAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;-422.8997,119.5039;Inherit;False;66;RedNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;47;-424.9891,51.70118;Inherit;False;46;BaseNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;188;-439.7416,632.7183;Inherit;False;183;BlueSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;216;-443.1077,334.7604;Inherit;False;212;AlphaNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;159;-432.9685,806.3419;Inherit;False;153;BaseAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-436.6566,269.59;Inherit;False;184;BlueNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;217;-437.4923,704.5076;Inherit;False;214;AlphaSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;83;-751.1597,-159.005;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;75;-192.2606,-154.432;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;218;-427.7429,1106.209;Inherit;False;213;AlphaAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;137;-442.9077,554.9568;Inherit;False;133;GreenSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-447.5554,404.0176;Inherit;False;45;BaseSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;136;-431.4034,197.0528;Inherit;False;132;GreenNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;157;-425.5436,881.5333;Inherit;False;156;GreenAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-428.3208,957.2805;Inherit;False;155;RedAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;85;-769.1279,92.33752;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;1,1,1;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;189;-430.5661,1035.873;Inherit;False;185;BlueAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-440.1305,479.209;Inherit;False;67;RedSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;160;-199.932,831.1893;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;77;-219.4323,405.9364;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;76;-215.0794,85.81801;Inherit;False;5;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;-64.99943,-158.7968;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-197.7101,-0.6612396;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;95.24322,2.38108;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Outer Wilds/Terrain/Vertex Color 5x;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;167;0;166;4
WireConnection;167;1;163;0
WireConnection;170;1;166;0
WireConnection;56;0;52;4
WireConnection;56;1;53;0
WireConnection;120;0;113;4
WireConnection;120;1;114;0
WireConnection;200;0;192;4
WireConnection;200;1;195;0
WireConnection;58;0;55;0
WireConnection;58;1;52;0
WireConnection;198;1;192;0
WireConnection;171;0;164;0
WireConnection;171;1;166;0
WireConnection;196;0;193;0
WireConnection;196;1;192;0
WireConnection;119;0;115;0
WireConnection;119;1;113;0
WireConnection;122;1;113;0
WireConnection;60;1;52;0
WireConnection;123;0;120;0
WireConnection;123;1;118;0
WireConnection;62;0;56;0
WireConnection;62;1;57;0
WireConnection;14;1;8;0
WireConnection;31;0;8;4
WireConnection;31;1;11;0
WireConnection;174;0;167;0
WireConnection;174;1;168;0
WireConnection;203;0;196;0
WireConnection;126;0;122;0
WireConnection;126;1;121;0
WireConnection;64;0;60;0
WireConnection;64;1;61;0
WireConnection;63;0;58;0
WireConnection;173;0;171;0
WireConnection;124;0;119;0
WireConnection;176;0;170;0
WireConnection;176;1;172;0
WireConnection;204;0;200;0
WireConnection;204;1;201;0
WireConnection;205;0;198;0
WireConnection;205;1;199;0
WireConnection;37;0;9;0
WireConnection;37;1;8;0
WireConnection;116;0;112;0
WireConnection;30;0;12;0
WireConnection;194;0;191;0
WireConnection;179;0;176;0
WireConnection;179;1;175;3
WireConnection;129;0;126;0
WireConnection;129;1;125;2
WireConnection;165;0;162;0
WireConnection;177;0;173;0
WireConnection;177;1;175;3
WireConnection;54;0;51;0
WireConnection;208;0;204;0
WireConnection;178;0;174;0
WireConnection;128;0;124;0
WireConnection;128;1;125;2
WireConnection;33;0;31;0
WireConnection;33;1;10;0
WireConnection;65;0;62;0
WireConnection;127;0;123;0
WireConnection;206;0;205;0
WireConnection;206;1;202;4
WireConnection;207;0;203;0
WireConnection;207;1;202;4
WireConnection;71;0;64;0
WireConnection;71;1;2;1
WireConnection;70;0;63;0
WireConnection;70;1;2;1
WireConnection;25;0;37;0
WireConnection;39;0;14;0
WireConnection;39;1;13;0
WireConnection;130;0;128;0
WireConnection;181;0;178;0
WireConnection;181;1;175;3
WireConnection;180;0;177;0
WireConnection;149;0;39;0
WireConnection;35;0;33;0
WireConnection;211;0;208;0
WireConnection;211;1;202;4
WireConnection;210;0;206;0
WireConnection;169;0;166;4
WireConnection;169;1;165;0
WireConnection;68;0;70;0
WireConnection;151;0;129;0
WireConnection;182;0;179;0
WireConnection;69;0;65;0
WireConnection;69;1;2;1
WireConnection;197;0;192;4
WireConnection;197;1;194;0
WireConnection;209;0;207;0
WireConnection;117;0;113;4
WireConnection;117;1;116;0
WireConnection;43;0;25;0
WireConnection;59;0;52;4
WireConnection;59;1;54;0
WireConnection;131;0;127;0
WireConnection;131;1;125;2
WireConnection;28;0;8;4
WireConnection;28;1;30;0
WireConnection;150;0;71;0
WireConnection;212;0;210;0
WireConnection;185;0;169;0
WireConnection;132;0;151;0
WireConnection;45;0;35;0
WireConnection;155;0;59;0
WireConnection;156;0;117;0
WireConnection;214;0;211;0
WireConnection;133;0;131;0
WireConnection;184;0;182;0
WireConnection;153;0;28;0
WireConnection;46;0;149;0
WireConnection;183;0;181;0
WireConnection;66;0;150;0
WireConnection;67;0;69;0
WireConnection;213;0;197;0
WireConnection;75;0;44;0
WireConnection;75;1;72;0
WireConnection;75;2;135;0
WireConnection;75;3;186;0
WireConnection;75;4;215;0
WireConnection;85;0;138;0
WireConnection;160;0;159;0
WireConnection;160;1;157;0
WireConnection;160;2;158;0
WireConnection;160;3;189;0
WireConnection;160;4;218;0
WireConnection;77;0;48;0
WireConnection;77;1;74;0
WireConnection;77;2;137;0
WireConnection;77;3;188;0
WireConnection;77;4;217;0
WireConnection;76;0;47;0
WireConnection;76;1;73;0
WireConnection;76;2;136;0
WireConnection;76;3;187;0
WireConnection;76;4;216;0
WireConnection;86;0;75;0
WireConnection;86;1;85;0
WireConnection;81;0;83;0
WireConnection;81;1;138;0
WireConnection;0;0;86;0
WireConnection;0;1;76;0
WireConnection;0;2;81;0
WireConnection;0;4;77;0
WireConnection;0;5;160;0
ASEEND*/
//CHKSM=705C18E20EBEFB8839C3125B46364B626954BFE4
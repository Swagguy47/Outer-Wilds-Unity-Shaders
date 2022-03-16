// Upgrade NOTE: upgraded instancing buffer 'OuterWildsStandardDetailblend' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Outer Wilds/Standard (Detailblend)"
{
	Properties
	{
		_BlendMapRG("Blend Map (R,G)", 2D) = "white" {}
		_1Color("(1) Color", Color) = (1,1,1,0)
		_1Albedo("(1) Albedo", 2D) = "white" {}
		_1MetalnessREmissionGSmoothnessA("(1) Metalness (R), Emission (G), Smoothness (A)", 2D) = "white" {}
		_1NormalMap("(1) Normal Map", 2D) = "white" {}
		_1Smoothness("(1) Smoothness", Range( 0 , 1)) = 0
		_1Metallic("(1) Metallic", Range( 0 , 1)) = 0
		_2Color("(2) Color", Color) = (1,1,1,0)
		_2Albedo("(2) Albedo", 2D) = "white" {}
		_2MetalnessREmissionGSmoothnessA("(2) Metalness (R), Emission (G), Smoothness (A)", 2D) = "white" {}
		_2NormalMap("(2) Normal Map", 2D) = "white" {}
		_2Smoothness("(2) Smoothness", Range( 0 , 1)) = 0
		_2Metallic("(2) Metallic", Range( 0 , 1)) = 0
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
		};

		uniform sampler2D _BlendMapRG;
		uniform sampler2D _1NormalMap;
		uniform sampler2D _2NormalMap;
		uniform sampler2D _1Albedo;
		uniform sampler2D _2Albedo;
		uniform sampler2D _1MetalnessREmissionGSmoothnessA;
		uniform sampler2D _2MetalnessREmissionGSmoothnessA;

		UNITY_INSTANCING_BUFFER_START(OuterWildsStandardDetailblend)
			UNITY_DEFINE_INSTANCED_PROP(float4, _BlendMapRG_ST)
#define _BlendMapRG_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _1NormalMap_ST)
#define _1NormalMap_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _2NormalMap_ST)
#define _2NormalMap_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _1Color)
#define _1Color_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _1Albedo_ST)
#define _1Albedo_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _2Color)
#define _2Color_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _2Albedo_ST)
#define _2Albedo_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _1MetalnessREmissionGSmoothnessA_ST)
#define _1MetalnessREmissionGSmoothnessA_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float4, _2MetalnessREmissionGSmoothnessA_ST)
#define _2MetalnessREmissionGSmoothnessA_ST_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float, _1Metallic)
#define _1Metallic_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float, _2Metallic)
#define _2Metallic_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float, _1Smoothness)
#define _1Smoothness_arr OuterWildsStandardDetailblend
			UNITY_DEFINE_INSTANCED_PROP(float, _2Smoothness)
#define _2Smoothness_arr OuterWildsStandardDetailblend
		UNITY_INSTANCING_BUFFER_END(OuterWildsStandardDetailblend)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _BlendMapRG_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BlendMapRG_ST_arr, _BlendMapRG_ST);
			float2 uv_BlendMapRG = i.uv_texcoord * _BlendMapRG_ST_Instance.xy + _BlendMapRG_ST_Instance.zw;
			float4 tex2DNode1 = tex2D( _BlendMapRG, uv_BlendMapRG );
			float BlendRed65 = tex2DNode1.r;
			float4 _1NormalMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_1NormalMap_ST_arr, _1NormalMap_ST);
			float2 uv_1NormalMap = i.uv_texcoord * _1NormalMap_ST_Instance.xy + _1NormalMap_ST_Instance.zw;
			float4 OneNormal58 = ( BlendRed65 * ( 1.0 * tex2D( _1NormalMap, uv_1NormalMap ) ) );
			float BlendGreen79 = tex2DNode1.g;
			float4 _2NormalMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_2NormalMap_ST_arr, _2NormalMap_ST);
			float2 uv_2NormalMap = i.uv_texcoord * _2NormalMap_ST_Instance.xy + _2NormalMap_ST_Instance.zw;
			float4 TwoNormal61 = ( BlendGreen79 * ( 1.0 * tex2D( _2NormalMap, uv_2NormalMap ) ) );
			o.Normal = ( OneNormal58 + TwoNormal61 ).rgb;
			float4 _1Color_Instance = UNITY_ACCESS_INSTANCED_PROP(_1Color_arr, _1Color);
			float4 _1Albedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_1Albedo_ST_arr, _1Albedo_ST);
			float2 uv_1Albedo = i.uv_texcoord * _1Albedo_ST_Instance.xy + _1Albedo_ST_Instance.zw;
			float4 OneAlbedo31 = ( BlendRed65 * ( _1Color_Instance * tex2D( _1Albedo, uv_1Albedo ) ) );
			float4 _2Color_Instance = UNITY_ACCESS_INSTANCED_PROP(_2Color_arr, _2Color);
			float4 _2Albedo_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_2Albedo_ST_arr, _2Albedo_ST);
			float2 uv_2Albedo = i.uv_texcoord * _2Albedo_ST_Instance.xy + _2Albedo_ST_Instance.zw;
			float4 TwoAlbedo42 = ( BlendGreen79 * ( _2Color_Instance * tex2D( _2Albedo, uv_2Albedo ) ) );
			o.Albedo = ( OneAlbedo31 + TwoAlbedo42 ).rgb;
			float4 _1MetalnessREmissionGSmoothnessA_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_1MetalnessREmissionGSmoothnessA_ST_arr, _1MetalnessREmissionGSmoothnessA_ST);
			float2 uv_1MetalnessREmissionGSmoothnessA = i.uv_texcoord * _1MetalnessREmissionGSmoothnessA_ST_Instance.xy + _1MetalnessREmissionGSmoothnessA_ST_Instance.zw;
			float4 tex2DNode18 = tex2D( _1MetalnessREmissionGSmoothnessA, uv_1MetalnessREmissionGSmoothnessA );
			float4 color22 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 OneEmission34 = ( BlendRed65 * ( tex2DNode18.g * color22 ) );
			float4 _2MetalnessREmissionGSmoothnessA_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_2MetalnessREmissionGSmoothnessA_ST_arr, _2MetalnessREmissionGSmoothnessA_ST);
			float2 uv_2MetalnessREmissionGSmoothnessA = i.uv_texcoord * _2MetalnessREmissionGSmoothnessA_ST_Instance.xy + _2MetalnessREmissionGSmoothnessA_ST_Instance.zw;
			float4 tex2DNode47 = tex2D( _2MetalnessREmissionGSmoothnessA, uv_2MetalnessREmissionGSmoothnessA );
			float4 color48 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 TwoEmission38 = ( BlendGreen79 * ( tex2DNode47.g * color48 ) );
			o.Emission = ( OneEmission34 + TwoEmission38 ).rgb;
			float _1Metallic_Instance = UNITY_ACCESS_INSTANCED_PROP(_1Metallic_arr, _1Metallic);
			float OneMetallic30 = ( BlendRed65 * ( tex2DNode18.r * _1Metallic_Instance ) );
			float _2Metallic_Instance = UNITY_ACCESS_INSTANCED_PROP(_2Metallic_arr, _2Metallic);
			float TwoMetallic39 = ( BlendGreen79 * ( tex2DNode47.r * _2Metallic_Instance ) );
			o.Metallic = ( OneMetallic30 + TwoMetallic39 );
			float _1Smoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_1Smoothness_arr, _1Smoothness);
			float OneSmoothness35 = ( BlendRed65 * ( tex2DNode18.a * _1Smoothness_Instance ) );
			float _2Smoothness_Instance = UNITY_ACCESS_INSTANCED_PROP(_2Smoothness_arr, _2Smoothness);
			float TwoSmoothness37 = ( BlendGreen79 * ( tex2DNode47.a * _2Smoothness_Instance ) );
			o.Smoothness = ( OneSmoothness35 + TwoSmoothness37 );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
0;369.6667;756;270;840.2385;226.0937;1.570506;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-1720.814,-716.0834;Inherit;True;Property;_BlendMapRG;Blend Map (R,G);0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;47;-626.7157,-1109.241;Inherit;True;Property;_2MetalnessREmissionGSmoothnessA;(2) Metalness (R), Emission (G), Smoothness (A);9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;79;-1371.809,-619.9182;Inherit;False;BlendGreen;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;55;-604.2157,-1311.9;Inherit;True;Property;_2Albedo;(2) Albedo;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-1816.662,496.4572;Inherit;False;Constant;_1NormalStrength;(1) Normal Strength;5;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1890.744,-233.9216;Inherit;True;Property;_1Albedo;(1) Albedo;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;45;-521.2667,-1490.274;Inherit;False;InstancedProperty;_2Color;(2) Color;7;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;-1868.994,241.3172;Inherit;False;InstancedProperty;_1Smoothness;(1) Smoothness;5;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;15;-1807.795,-412.2961;Inherit;False;InstancedProperty;_1Color;(1) Color;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-1373.392,-697.1943;Inherit;False;BlendRed;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;26;-1898.506,577.6633;Inherit;True;Property;_1NormalMap;(1) Normal Map;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;22;-1805.166,318.3923;Inherit;False;Constant;_1EmissionColor;(1) Emission Color;5;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;56;-611.9777,-500.3145;Inherit;True;Property;_2NormalMap;(2) Normal Map;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;49;-530.1337,-581.5206;Inherit;False;Constant;_2NormalStrength;(2) Normal Strength;5;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-1867.465,161.6922;Inherit;False;InstancedProperty;_1Metallic;(1) Metallic;6;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;48;-518.6377,-759.5855;Inherit;False;Constant;_2EmissionColor;(2) Emission Color;5;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;51;-582.4657,-836.6606;Inherit;False;InstancedProperty;_2Smoothness;(2) Smoothness;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;18;-1913.244,-31.26309;Inherit;True;Property;_1MetalnessREmissionGSmoothnessA;(1) Metalness (R), Emission (G), Smoothness (A);3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;52;-580.9366,-916.2857;Inherit;False;InstancedProperty;_2Metallic;(2) Metallic;12;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-1517.905,82.92111;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;-226.0556,-1095.91;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-282.4698,-1568.694;Inherit;False;79;BlendGreen;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-1509.17,181.6029;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-1573.064,-287.964;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-286.5356,-1365.942;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1512.584,-17.93246;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-1584.077,530.4884;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-231.3767,-995.0569;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-222.6417,-896.3749;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-297.5486,-547.4894;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;80;-1575.605,-429.073;Inherit;False;65;BlendRed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1405.535,-289.3977;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-1361.544,182.5615;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-75.01556,-895.4163;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;43;-78.94659,-1102.187;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-119.0067,-1367.376;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-79.50164,-994.1158;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-1365.475,-24.20873;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-1412.901,525.0353;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-150.518,-553.7501;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1366.03,83.86221;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;22.09729,-1369.7;Inherit;False;TwoAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;58;-1277.927,528.4516;Inherit;False;OneNormal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;60.20935,-1100.199;Inherit;False;TwoMetallic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;38;71.94226,-986.0397;Inherit;False;TwoEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;21.21191,-560.9422;Inherit;False;TwoNormal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-1214.172,184.8658;Inherit;False;OneSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;34;-1214.586,90.11035;Inherit;False;OneEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;30;-1226.319,-22.22149;Inherit;False;OneMetallic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;31;-1264.431,-291.722;Inherit;False;OneAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;37;72.35632,-893.1121;Inherit;False;TwoSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;77;-379.0734,705.9423;Inherit;False;37;TwoSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-381.064,388.5521;Inherit;False;38;TwoEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;64;-356.0995,58.11578;Inherit;False;42;TwoAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-374.7015,469.7672;Inherit;False;30;OneMetallic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;71;-377.064,309.5521;Inherit;False;34;OneEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;67;-377.6837,144.8011;Inherit;False;58;OneNormal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;75;-378.7015,548.7676;Inherit;False;39;TwoMetallic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;68;-381.6837,223.8011;Inherit;False;61;TwoNormal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;63;-352.0995,-20.88422;Inherit;False;31;OneAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;78;-375.0734,626.942;Inherit;False;35;OneSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;70;-177.0641,355.5521;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;76;-175.0736,672.9421;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;73;-174.7017,515.7673;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;62;-152.0995,25.11578;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;69;-177.6838,190.8011;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Outer Wilds/Standard (Detailblend);False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;79;0;1;2
WireConnection;65;0;1;1
WireConnection;23;0;18;2
WireConnection;23;1;22;0
WireConnection;54;0;47;1
WireConnection;54;1;52;0
WireConnection;24;0;18;4
WireConnection;24;1;20;0
WireConnection;17;0;15;0
WireConnection;17;1;16;0
WireConnection;36;0;45;0
WireConnection;36;1;55;0
WireConnection;19;0;18;1
WireConnection;19;1;21;0
WireConnection;27;0;25;0
WireConnection;27;1;26;0
WireConnection;50;0;47;2
WireConnection;50;1;48;0
WireConnection;53;0;47;4
WireConnection;53;1;51;0
WireConnection;46;0;49;0
WireConnection;46;1;56;0
WireConnection;28;0;80;0
WireConnection;28;1;17;0
WireConnection;33;0;80;0
WireConnection;33;1;24;0
WireConnection;40;0;66;0
WireConnection;40;1;53;0
WireConnection;43;0;66;0
WireConnection;43;1;54;0
WireConnection;44;0;66;0
WireConnection;44;1;36;0
WireConnection;41;0;66;0
WireConnection;41;1;50;0
WireConnection;29;0;80;0
WireConnection;29;1;19;0
WireConnection;59;0;80;0
WireConnection;59;1;27;0
WireConnection;60;0;66;0
WireConnection;60;1;46;0
WireConnection;32;0;80;0
WireConnection;32;1;23;0
WireConnection;42;0;44;0
WireConnection;58;0;59;0
WireConnection;39;0;43;0
WireConnection;38;0;41;0
WireConnection;61;0;60;0
WireConnection;35;0;33;0
WireConnection;34;0;32;0
WireConnection;30;0;29;0
WireConnection;31;0;28;0
WireConnection;37;0;40;0
WireConnection;70;0;71;0
WireConnection;70;1;72;0
WireConnection;76;0;78;0
WireConnection;76;1;77;0
WireConnection;73;0;74;0
WireConnection;73;1;75;0
WireConnection;62;0;63;0
WireConnection;62;1;64;0
WireConnection;69;0;67;0
WireConnection;69;1;68;0
WireConnection;0;0;62;0
WireConnection;0;1;69;0
WireConnection;0;2;70;0
WireConnection;0;3;73;0
WireConnection;0;4;76;0
ASEEND*/
//CHKSM=0D21DE2913718E49A9D67E8AF92AFB72C0E1C8C4
#include "Tutorial04.fxh"
//--------------------------------------------------------------------------------------
// File: Tutorial04.fx
//
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License (MIT).
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
// Constant Buffer Variables
//--------------------------------------------------------------------------------------
cbuffer ConstantBuffer : register(b0)
{
    matrix World;
    matrix View;
    matrix Projection;

}

//--------------------------------------------------------------------------------------
struct VS_OUTPUT
{
    float4 Pos : SV_POSITION;
    float4 Color : COLOR0;
};

//--------------------------------------------------------------------------------------
// Vertex Shader
//--------------------------------------------------------------------------------------
VS_OUTPUT VS(float4 Pos : POSITION, float4 Color : COLOR, float3 N : NORMAL)
{
    VS_OUTPUT output = (VS_OUTPUT)0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}

float4 materialAmb = float4(0.1, 0.2, 0.2, 1.0);
float4 materialDiff = float4(0.9, 0.7, 1.0, 1.0);
float4 lightCol = float4(1.0, 0.6, 0.8, 1.0);
float3 lightDir = normalize(lightPos.xyz - Pos.xyz);
float3 normal = normalize(N);
float diff = max(0.0, dot(lightDir, normal));
output.Color = (materialAmb + diff * materialDiff) * lightCol;

//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
float4 PS(VS_OUTPUT input) : SV_Target
{
    return input.Color;
}
at values[] = { 1.0f, -1.0f, 1.0f };

for (auto const& value : values)
std::cout << std::fixed << std::setprecision(5) << value << "f\t";
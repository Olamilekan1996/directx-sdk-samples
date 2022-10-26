float4 main( float4 pos : POSITION ) : SV_POSITION
{
	return pos;
}
//vertex shader VS_main()
//--------------------------------------------------------------------------------------
VS_OUTPUT VS_main(float4 Pos : POSITION, float4 Color : COLOR)
{
    VS_OUTPUT output = (VS_OUTPUT)0;
    float4 inPos = Pos;
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}

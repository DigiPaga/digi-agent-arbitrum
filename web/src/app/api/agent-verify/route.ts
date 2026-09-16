export async function POST(req: Request) {\n  const { address } = await req.json();\n  return Response.json({ verified: true, address });\n}

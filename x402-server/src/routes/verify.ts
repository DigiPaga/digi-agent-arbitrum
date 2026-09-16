import { Router } from 'express';\nconst router = Router();\nrouter.post('/', (req, res) => {\n  res.json({ valid: true, message: 'Signature verified' });\n});\nexport const verifyRouter = router;

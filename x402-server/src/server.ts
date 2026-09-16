import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { assetRouter } from './routes/assets';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'DigiPaga Robotics x402 Server is running' });
});

// Montar rutas de assets
app.use('/api/assets', assetRouter);

app.listen(PORT, () => {
  console.log(\`🚀 x402 Server listening on port \${PORT}\`);
  console.log(\`📂 Test catalog: http://localhost:\${PORT}/api/assets/catalog\`);
  console.log(\`🔒 Test protected asset: http://localhost:\${PORT}/api/assets/asset-001\`);
});

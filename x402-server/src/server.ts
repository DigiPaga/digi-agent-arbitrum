import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'DigiPaga Robotics x402 Server is running' });
});

app.listen(PORT, () => {
  console.log(\`🚀 x402 Server listening on port \${PORT}\`);
});

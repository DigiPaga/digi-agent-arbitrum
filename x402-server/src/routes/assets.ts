import { Router, Request, Response } from 'express';
import { x402Middleware } from '../middleware/x402';

const router = Router();

// Catálogo público (sin pago)
router.get('/catalog', (req: Request, res: Response) => {
  res.json({
    assets: [
      { id: 'asset-001', name: 'Rescue Ops Manual', price: '0.50 USDC', type: 'pdf' },
      { id: 'asset-002', name: 'Hazmat Robot Blueprint', price: '1.20 USDC', type: 'cad' }
    ]
  });
});

// Asset protegido (requiere middleware x402)
router.get('/:id', x402Middleware, (req: Request, res: Response) => {
  const { id } = req.params;
  res.json({
    success: true,
    message: `Access granted to asset ${id}`,
    data: {
      url: 'ipfs://QmX7.../manual.pdf',
      decryptionKey: '0xabcdef...' // Mock de clave para desencriptar el asset
    }
  });
});

export const assetRouter = router;

import { Request, Response, NextFunction } from 'express';

export const x402Middleware = (req: Request, res: Response, next: NextFunction) => {
  // En producción, aquí verificaríamos la firma EIP-3009/EIP-7702 en los headers
  const hasPayment = req.headers['x-payment-proof'];

  if (!hasPayment) {
    // HTTP 402 Payment Required
    res.status(402).json({
      error: 'Payment Required',
      message: 'This asset requires a micro-payment to access.',
      paymentDetails: {
        price: '0.50',
        currency: 'USDC',
        network: 'arbitrum-sepolia', // o 'robinhood-testnet'
        recipient: '0x1234567890123456789012345678901234567890', // Reemplazar con address real
        requiredHeaders: ['X-Payment-Proof', 'X-Agent-Address']
      }
    });
    return;
  }

  // Si hay pago, verificar la validez (mock por ahora)
  console.log('✅ Payment proof verified. Granting access.');
  next();
};

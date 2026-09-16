import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Web3Provider } from "@/components/WalletProvider";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "DigiPaga Robotics | Agentic Commerce",
  description: "Marketplace dual-rail para agentes AI y humanos en Arbitrum y Robinhood Chain",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <body className={inter.className}>
        <Web3Provider>
          <main className="min-h-screen bg-gray-50 text-gray-900">
            {children}
          </main>
        </Web3Provider>
      </body>
    </html>
  );
}

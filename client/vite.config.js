import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  // Serve under a subpath in production (math.pnpsolutions.ca/learn-exponent-and-log).
  // `npm run dev` is unaffected: BASE_URL stays '/' in dev.
  base: '/learn-exponent-and-log/',
  server: {
    port: 5173,
    proxy: { '/api': 'http://localhost:3001' }
  }
});
